library(keras)
install_keras()
library(nnet)
head(data <- as.matrix(cbind(scale(data[1:4]), data[5])))
head(i <- sample(1:nrow(data), size= round(0.7*nrow(data))))
data <- list(data[i,1:4], class.ind(data[i,5]), data[-i,1:4], class.ind(data[-i,5]))

summary(fit.keras <- keras_model_sequential() %>% 
  layer_dense(input_shape = 4, activation = "relu", units = 100) %>% 
  layer_dense(units = 3, activation = "softmax") %>% 
  complie(loss = "categorical_crossentropy", optimizer = "rmsprop", metrics = c("accuracy")))

fit(fit.keras, data[1], data[2], epochs = 100, validation_data = list(data[3], data[4]))
