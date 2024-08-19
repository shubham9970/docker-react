FROM node:alpine as builder
WORKDIR '/app'
COPY ./ ./
RUN npm install
RUN npm install --save-dev @babel/plugin-proposal-private-property-in-object
RUN npm run build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
           #----SOURCE ------- --- DESTINATION -----