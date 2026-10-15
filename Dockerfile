FROM node:15-alpine AS build

WORKDIR /app

COPY package*.json .npmrc ./
RUN npm ci

COPY . .

# CRA bakes REACT_APP_* values into the bundle at build time
ARG REACT_APP_API_URL=""
ENV REACT_APP_API_URL=$REACT_APP_API_URL
RUN npm run build

FROM nginx:1.21-alpine

COPY --from=build /app/build /usr/share/nginx/html
# nginx.conf holds a server block, so it belongs in conf.d, not the main nginx.conf
COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
