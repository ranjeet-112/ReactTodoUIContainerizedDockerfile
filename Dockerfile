FROM node:16 AS Build
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

FROM nginx:alpine
COPY --from=Build /app/build /usr/share/nginx/html
CMD ["nginx", "-g", "daemon off;"]


