import {createCompany, updateCompanyById} from "../../../src/services/company";
import {prismaMock} from "../../../singleton";
import {Company} from "@prisma/client";

test('should create new company', async () => {
  
  const company: Company = {
    id: 1,
    name: 'Test Company',
    notes: 'Test description',
  }
  
  prismaMock.company.create.mockResolvedValue(company)
  
  await expect(createCompany(company)).resolves.toEqual({
    id: 1,
    name: 'Test Company',
    notes: 'Test description',
  })
})

test('should update a company name', async () => {
  
  const company: Company = {
    id: 1,
    name: 'Test Company Changed',
    notes: 'Test description',
  }
  
  prismaMock.company.update.mockResolvedValue(company)
  
  await expect(updateCompanyById(company.id, company)).resolves.toEqual(
    {
      id: 1,
      name: 'Test Company Changed',
      notes: 'Test description',
    }
  )
  
})

