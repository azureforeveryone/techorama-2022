# build environment
FROM azureforeveryoneregistry.azurecr.io/node:13.12.0-alpine as build
WORKDIR /app
ENV PATH /app/node_modules/.bin:$PATH
COPY lottery-game/package.json ./
COPY lottery-game/package-lock.json ./
RUN npm ci --silent
RUN npm install react-scripts@3.4.1 -g --silent
COPY lottery-game ./
RUN npm run build

# production environment
FROM azureforeveryoneregistry.azurecr.io/nginx:stable-alpine
COPY --from=build /app/build /usr/share/nginx/html
# new
COPY nginx.conf /etc/nginx/conf.d/default.conf
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]