# Sometimes a paper will not report the SE but will  provide you with the size of the treatment groups  and of the control group, as well as the 
# proportion  or number of people that voted in each group. This is enough information to calculate the SE by hand. Let TG denote treated people  and CG those in the pure control or  placebo. For brevity, I am only using one  TG here, but this generalises to multi-arm experiments. Let Ni be the number of  people in group i and Yi be the number  of people who voted/got registered in  group i; also let, pi denote Yi/Ni. Then, given the outcome is binary, you can calculate the SE as: 100*sqrt((pTG*(1-pTG)/(NTG-1)) + (pCG*(1-pCG)/(NCG-1))). Note the multiplication by 100 so that the SE is in percentage points. Note that when you calculate the SE in this way the SE is not clustered,  and it only applies to the covariate-unadjusted ITT.

recover_SE <- function(
    use_prop = TRUE,
    x100 = TRUE,
    N_group1 = NA,
    N_group2 = NA, 
    Y_group1 = NA, 
    Y_group2 = NA,
    p_group1 = NA, #NOTE must be as decimal
    p_group2 = NA
){

if(use_prop == TRUE){
    # TODO add checks and coversions

    se <- sqrt(
        (p_group1*(1-p_group1))/(N_group1-1) + 
        (p_group2*(1-p_group2))/(N_group2-1)
    )

    se <- ifelse(x100==TRUE, se*100, se)

} else{

    p_group1 <- Y_group1/N_group1
    p_group2 <- Y_group2/N_group2

    se <- sqrt(
        (p_group1*(1-p_group1))/(N_group1-1) +
        (p_group2*(1-p_group2))/(N_group2-1)
    )

    se <- ifelse(x100==TRUE, se*100, se)

}

return(se)

}

#TODO add recover p-val and ate to function

# CAMSOC222
se <- recover_ses(
    p_group1 = 12.1/100,
    p_group2 = 3.5/100,
    N_group1 = 59,
    N_group2 = 59
    )

ate = 12.1-3.5

z_value = ate/se

pnorm(z, lower.tail=TRUE)
