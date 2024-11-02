# Cats vs Dogs
Creating a simple Image Recognition application to detect images selected from gallery or camera using core ML Model
This will be done using pre-trained models


### Data Set: 
-> LINK:        https://www.kaggle.com/datasets/samuelcortinhas/cats-and-dogs-image-classification
-> Description: Data set containing images of cats and dogs


### iOS Stack: **SwiftUI**

### Steps to Create Model
1. Take the sample data-set with a parent folder containing all the N-different classes which we want to classify
2. Add images in the N-different folders immediately under parent folder
3. Create 2 such samples of parent folders, one for testing and one for training
4. Open Create ML and select Image Classifier
5. Select the training parent folder
6. Train the model
7. Use the output model to use in apps

<img width="861" alt="Screenshot 2024-11-01 at 8 00 03 PM" src="https://github.com/user-attachments/assets/fd7495db-8773-4518-8760-27c1ee6548f7">


Results:
Model Size: 17Kb 
Training Size: 140 images

![WhatsApp Image 2024-11-02 at 8 45 03 AM](https://github.com/user-attachments/assets/6633add9-b121-40fb-aa65-fd8150de52e6)
![WhatsApp Image 2024-11-02 at 8 45 02 AM](https://github.com/user-attachments/assets/d6371216-307d-4058-9a13-bd0e6c082d31)


