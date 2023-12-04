
import {Request, Response} from "express";
import {
  createCompany,
  deleteCompanyById,
  getCompanyById,
  getListOfCompanies,
  updateCompanyById
} from "../services/company";


export const GetAllCompaniesController = async (req: Request, res: Response) => {
  try {
    const companies = await getListOfCompanies();
    res.status(200).json(companies);
  } catch (error) {
    if (error instanceof Error) {
      console.error('Error fetching companies:', error.message);
      res.status(500).json({
        message: "An error occurred while fetching the list of companies."
      });
    } else {
      console.error('Unexpected error:', error);
      res.status(500).json({
        message: "An unexpected error occurred."
      });
    }
  }
}


export const CreateCompanyController = async (req: Request, res: Response) => {
  try {
    const company = await createCompany(req.body)
    res.status(200).json(company);
  } catch (error) {
    if (error instanceof Error) {
      console.error('Error creating company:', error.message);
      res.status(500).json({
        message: "An error occurred while creating the company."
      });
    } else {
      console.error('Unexpected error:', error);
      res.status(500).json({
        message: "An unexpected error occurred."
      });
    }
  }
  
}

export const GetCompanyByIdController = async (req: Request, res: Response) => {
  try {
    const company = await getCompanyById(Number(req.params.id));
    if (company) {
      res.status(200).json(company);
    } else {
      res.status(404).json({
        message: `Company with id ${req.params.id} not found.`
      });
    }
  } catch (error) {
    if (error instanceof Error) {
      console.error('Error fetching company:', error.message);
      res.status(500).json({
        message: "An error occurred while fetching the company."
      });
    } else {
      console.error('Unexpected error:', error);
      res.status(500).json({
        message: "An unexpected error occurred."
      });
    }
  }
}

export const DeleteCompanyByIdController = async (req: Request, res: Response) => {
  try {
    const company = deleteCompanyById(Number(req.params.id));
    if (company) {
      res.status(200).json(company);
    } else {
      res.status(404).json({
        message: `Company with id ${req.params.id} not found.`
      });
    }
  } catch (error) {
    if (error instanceof Error) {
      console.error('Error deleting company:', error.message);
      res.status(500).json({
        message: "An error occurred while deleting the company."
      });
    } else {
      console.error('Unexpected error:', error);
      res.status(500).json({
        message: "An unexpected error occurred."
      });
    }
  }
}

export const UpdateCompanyByIdController = async (req: Request, res: Response) => {
  try {
    const company = await updateCompanyById(Number(req.params.id), req.body);
    if (company) {
      res.status(200).json(company);
    } else {
      res.status(404).json({
        message: `Company with id ${req.params.id} not found.`
      });
    }
  } catch (error) {
    if (error instanceof Error) {
      console.error('Error updating company:', error.message);
      res.status(500).json({
        message: "An error occurred while updating the company."
      });
    } else {
      console.error('Unexpected error:', error);
      res.status(500).json({
        message: "An unexpected error occurred."
      });
    }
  }
}