library(pvmcomparison)
library(precrec)
library(latex2exp)

x <- read_rds("results/dag_50000_500_500_1.000_20.000_1.000_20.000_0_0.500_250_1.500_1.RDS")

x1 <- x
m <- c("ROR", "ROR025", "ROR05", "Q", "Q025", "Q05", "PRR", "PRR025", "PRR05", "RRR", "lbinomial", "ICOrig", "ICOrig025", "ICOrig05", "ICAlt", "ICAlt025", "ICAlt05", "GPS", "GPS025", "GPS05", "ppoisson", "chi2", "chi2Yates", "RFET", "midRFET", "highest_lambda")
x <- x %>% mutate_at(.vars = m, funs(ifelse(a < 4, NA, .)))

# no bystanders
# methods: 
#   ROR
#   ROR025
#   EB025
#   IC025
#   chisq
#   PRR
#   PRR025

# create a list with all the data
res <- list()
res$scores[[1]][1] <- list(x$GPS025)
res$scores[[1]][2] <- list(x$ICAlt025)
res$scores[[1]][3] <- list(-1*x1$chi2) # since it's a p-value
res$scores[[1]][4] <- list(x$PRR)
res$scores[[1]][5] <- list(x$PRR025)
res$scores[[1]][6] <- list(x$ROR)
res$scores[[1]][7] <- list(x$ROR025)


res$labels <- c(x$associated)
res$modnames <- c("GPS025", "ICAlt025", "chi2", "PRR", "PRR025", "ROR", "ROR025")
res$dsids <- rep(1,7)

dat <- mmdata(res[["scores"]], res[["labels"]], modnames = res[["modnames"]])

# Calculate ROC and Precision-Recall curves for multiple models
mscurves <- evalmod(dat)
# Show ROC and Precision-Recall curves with the ggplot2 package
p <- autoplot(mscurves, "PRC") + 
  ggtitle("Precision Recall Curves") + 
  scale_color_discrete(name = "method",
                       labels= unname(TeX(c("$EB_{025}$", "IC_{025}^{alternative}", "$\\chi^2$", "PRR", "$PRR_{025}$", "ROR", "$ROR_{025}$")))) + 
  theme(legend.position = "right", legend.text.align = 0)
  
ggsave("figures/prccurves.pdf",
  plot = p,
  device = NULL,
  path = NULL,
  scale = 1,
  width = 174,
  height = 200,
  units = "mm",
  dpi = 1000,
  limitsize = TRUE
)
