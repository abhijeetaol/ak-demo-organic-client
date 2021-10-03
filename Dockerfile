FROM node:latest as build

# set working dir
WORKDIR /app

# Add the source code to app
COPY ./ /app/

# install all dependancy
RUN npm install

# Generate build of the application
RUN npm run build

# Stage2 : Serve app with aginx server

# Use official nginx image as bas image
FROM docker2021repos/nginx:latest

# Copy the build output to replace the default nginx content
COPY --from=build /app/dist/organic-client /usr/share/nginx/html

# Expose port
EXPOSE 4200
