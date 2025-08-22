##FROM node:20-alpine
FROM public.ecr.aws/docker/library/node:20-alpine

WORKDIR /app
COPY package*.json ./
RUN npm ci --only=production
COPY . .
ENV PORT=3000
EXPOSE 3000
CMD ["npm", "start"]