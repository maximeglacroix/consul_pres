x = summary(mod1)
library(sjPlot)
library(sjmisc)
library(sjlabelled)
tab_model(mod1,transform = NULL,
          show.ci = NULL,
          show.std="std",
          show.stat = TRUE)
summary(mod1)

mod2 <- betareg(Value~continent|continent,link = ("logit"),data=dat_prop)
tab_model(mod2,transform = NULL,
          show.ci = NULL,
          show.std="std",
          show.stat = TRUE)

