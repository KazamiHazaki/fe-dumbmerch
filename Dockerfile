FROM node:16-alpine as build
WORKDIR /dumbmerch-fe
COPY . /dumbmerch-fe
RUN npm install

FROM node:16-alpine
COPY --from=build /dumbmerch-fe /dumbmerch-fe
WORKDIR /dumbmerch-fe
EXPOSE 3000
CMD ["npm","run","start"]

