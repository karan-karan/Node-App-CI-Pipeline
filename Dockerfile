FROM node:18-alpine #Use the official Node.js 18 image based on Alpine Linux for a lightweight container

WORKDIR /app         #Set the working directory inside the container

COPY package*.json ./ #Copy package.json and package-lock.json to the working directory

RUN npm install      #Install the dependencies listed in package.json

COPY . .             #Copy the rest of the application code to the working directory

EXPOSE 3000          #Expose port 3000 for the application

CMD ["npm", "start"] #Start the application using npm start
