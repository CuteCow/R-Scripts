#install.packages('neuralnet')
library(neuralnet)

traininginput <-  as.data.frame(runif(50, min=0, max=250))#
trainingoutput <- sqrt(traininginput)

trainingdata <- cbind(traininginput, trainingoutput)

colnames(trainingdata) <- c('input', 'output')

net.sqrt <- neuralnet(formula = output~input, 
                      data = trainingdata, hidden = 10,
                      threshold = 0.01,
                      lifesign = "full",
                      lifesign.step = 10)
print(net.sqrt)
plot(net.sqrt)

testinput <-  as.data.frame(runif(50, min=0, max=250))
net.results <- compute(net.sqrt, testinput)
results <- data.frame(actual = testset$dividend, prediction = nn.results$net.result)


max(sqrt(testinput) - net.results$net.result)

t <- as.data.frame(1:100)

net.results <- compute(net.sqrt, t)
x <- sqrt(t) - net.results$net.result

plot(x)
