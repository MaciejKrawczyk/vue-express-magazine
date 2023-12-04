import express, { Express } from 'express';
import cors from 'cors';
import {CompanyRouter} from "./src/routes/company";

export const app: Express = express();
const port = 8080;

app.use(express.json());

app.use(cors({
  origin: 'http://localhost:3000'
}));


app.use('/company', CompanyRouter);


app.listen(port, () => {
  console.log(`Server running on port ${port}`);
});