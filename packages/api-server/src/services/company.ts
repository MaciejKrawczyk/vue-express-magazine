import prisma from "../../client";
import {Company} from "@prisma/client";

export async function getListOfCompanies(): Promise<Company[]> {
  return prisma.company.findMany()
}

export async function createCompany(company: Company): Promise<Company> {
  return prisma.company.create({
    data: company
  })
}

export async function getCompanyById(id: number): Promise<Company | null> {
  return prisma.company.findUnique({
    where: {
      id
    }
  })
}

export async function deleteCompanyById(id: number): Promise<Company | null> {
  return prisma.company.delete({
    where: {
      id
    }
  })
}

export async function updateCompanyById(id: number, company: Company): Promise<Company | null> {
  return prisma.company.update({
    where: {
      id
    },
    data: company
  })
}