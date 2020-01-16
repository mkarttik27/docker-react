# Creating temp Container 1 to create build folder
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# Creating the 2nd and final container for nginx
FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html
