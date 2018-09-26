library(betareg)
setwd("C:/Users/Maxime Lacroix/Desktop/consul_pres/Présentation_1")
source("code_base.R")
library(lmtest)
mod1 <- betareg(Value~continent,
                link = "logit",
                data=dat_prop)

mod2 <- betareg(Value~continent|continent,
                link = "logit",
                link.phi = "log",
                data=dat_prop)
mod3 <- betareg(Value~continent|1,
                link = "log",
                link.phi = "identity",
                data=dat_prop)

mod4 <- betatree(Value~continent,
                 ~Decennie, 
                 link = "logit",
                 data=dat_prop,
                 minsize=100)
plot(mod4)
lrtest(mod1,mod2)
lrtest(mod3,mod2)
lrtest(mod1,mod3)
summary(mod3)
summary(mod2)
summary(mod1)

AIC(mod1,mod2,mod3)
BIC(mod1,mod2,mod3)
