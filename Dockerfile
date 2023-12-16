FROM tensorflow/serving:2.14.1

ENV MODEL_NAME=food_rating
ENV TF_CPP_VMODULE=http_server=1

COPY /model /models/${MODEL_NAME}/1/

CMD ["tensorflow_model_server", "--rest_api_port=8502", "--model_name=food_rating", "--model_base_path=/models/food_rating"]
