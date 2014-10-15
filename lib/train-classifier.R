#
# trains a classification model that can distinguish legit vs malicious domains
#
train_classifier <- function (formula, data, p = 0.80) {
    
    # sanity checks
    stopifnot (is (formula, "formula"))
    stopifnot (is.data.frame (data))
    
    # train the model and return it
    model <- train (form      = formula, 
                    data      = data.frame (data), 
                    method    = "gbm", 
                    trControl = trainControl (method = "boot", p = p))
}
