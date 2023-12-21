# ml-food-rating

![TensorFlow](https://img.shields.io/badge/TensorFlow-%23FF6F00.svg?style=for-the-badge&logo=TensorFlow&logoColor=white)
![Keras](https://img.shields.io/badge/Keras-%23D00000.svg?style=for-the-badge&logo=Keras&logoColor=white)
![Docker](https://img.shields.io/badge/docker-%230db7ed.svg?style=for-the-badge&logo=docker&logoColor=white)
[![Google Colab](https://img.shields.io/badge/open_in_colab-blue?style=for-the-badge&logo=googlecolab&color=blue&labelColor=525252)](https://colab.research.google.com/github/MamMates/ml-food-rating/blob/main/MamMates_Food_Rating.ipynb)
![LICENSE](https://img.shields.io/github/license/MamMates/ml-food-rating?style=for-the-badge)
![Docker Version](https://img.shields.io/docker/v/putuwaw/mammates-food-rating/latest?style=for-the-badge)
![Docker Pulls](https://img.shields.io/docker/pulls/putuwaw/mammates-food-rating?style=for-the-badge)

Food Rating Classification using Convolutional Neural Network (CNN) and deployed using TensorFlow Serving.

Notebook: [MamMates Food Rating](https://colab.research.google.com/github/MamMates/ml-food-rating/blob/main/MamMates_Food_Rating.ipynb)

Dataset: [Food Rating Dataset](https://drive.google.com/drive/folders/1OwdbiUJx1BT-VuO9t7jAnAHsJNDiRJUp)

## Features 💡

Using Mammates Food Rating, you can categorize food images into 3 classes.

| Class | Label                      |
| ----- | -------------------------- |
| 0     | Rating 1 (MamRates ⭐)     |
| 1     | Rating 2 (MamRates ⭐⭐)   |
| 2     | Rating 3 (MamRates 🌟🌟🌟) |

## Prerequisites 📋

- [TensorFlow](https://www.tensorflow.org/) 2.14.0 or higher
- [Docker](https://www.docker.com/) 24.0.7 or higher

## Usage ✨

If you already have Docker installed, you only need to run the following command:

- Pull the image from Docker Hub:

```bash
docker pull putuwaw/mammates-food-rating
```

- Run the image:

```bash
docker run -p 8502:8502 --name ml-rating putuwaw/mammates-food-rating
```

- You can check that the model is already running by opening the browser and go to http://localhost:8502/v1/models/food_rating

- To do prediction, you can use the following command:

```bash
curl -s https://raw.githubusercontent.com/MamMates/ml-food-rating/main/example.json | curl -X POST -d @- http://localhost:8502/v1/models/food_rating:predict
```

- You will get the following response:

```json
{
  "predictions": [[0.00170704955, 0.46321556, 0.535077393]]
}
```

## Development 💻

If you want to develop this model, you can follow the steps below:

- Clone this repository:

```bash
git clone https://github.com/MamMates/ml-food-rating.git
```

- Update the model by changing the saved model in the [model](model/) folder.

- Build the Docker image:

```bash
docker build -t mammates-food-rating .
```

- Run the image:

```bash
docker run -p 8502:8502 --name ml-rating mammates-food-rating
```

- You can check that the model is already running by opening browser and go to http://localhost:8502/v1/models/food_rating

- To do prediction, you can use the following command:

```bash
curl -d @example.json -X POST http://localhost:8502/v1/models/food_rating:predict
```

- To stop the container:

```bash
docker stop ml-rating
```

> [!NOTE]  
> If you want to learn more about TensorFlow Serving, you can read the REST API documentation [here](https://www.tensorflow.org/tfx/serving/api_rest).

## License 📝

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
