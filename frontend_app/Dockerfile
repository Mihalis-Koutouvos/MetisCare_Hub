FROM node:16

WORKDIR /frontend_app

COPY package*json ./

RUN npm install

COPY ./src ./src
COPY ./public ./public 

EXPOSE 8501

CMD ["npm", "start"]
