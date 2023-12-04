import express from "express";
import {
  CreateCompanyController,
  DeleteCompanyByIdController,
  GetAllCompaniesController,
  GetCompanyByIdController, UpdateCompanyByIdController
} from "../controllers/company";


const router = express.Router();


router.get('/', GetAllCompaniesController);

router.post('/', CreateCompanyController);

router.get('/:id', GetCompanyByIdController);

router.delete('/:id', DeleteCompanyByIdController);

router.put('/:id', UpdateCompanyByIdController);


export {router as CompanyRouter}