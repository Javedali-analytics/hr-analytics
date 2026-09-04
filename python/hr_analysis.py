
# ============================================================
# HR Analytics — Employee Attrition Analysis
# Python Exploratory Data Analysis
# Dataset: IBM HR Analytics Employee Attrition
# ============================================================

import pandas as pd
import matplotlib.pyplot as plt


# ============================================================
# 01. Load Dataset
# ============================================================

df = pd.read_csv("WA_Fn-UseC_-HR-Employee-Attrition.csv")


# ============================================================
# 02. Basic Dataset Information
# ============================================================

print("Dataset Shape:", df.shape)

print("\nColumn Names:")
print(df.columns.tolist())

print("\nMissing Values:")
print(df.isnull().sum().sum())

print("\nDuplicate Rows:")
print(df.duplicated().sum())

print("\nFirst 5 Rows:")
print(df.head())


# ============================================================
# 03. Overall Attrition
# ============================================================

attrition_count = df["Attrition"].value_counts()

print("\nAttrition Count:")
print(attrition_count)

print("\nAttrition Percentage:")
print(
    df["Attrition"]
    .value_counts(normalize=True)
    .mul(100)
    .round(2)
)


# ============================================================
# 04. Department-wise Attrition Rate
# ============================================================

department_attrition = (
    df.groupby("Department")["Attrition"]
    .apply(lambda x: (x == "Yes").mean() * 100)
    .round(2)
    .sort_values(ascending=False)
)

print("\nDepartment-wise Attrition Rate:")
print(department_attrition)


# ============================================================
# 05. Job Role-wise Attrition Rate
# ============================================================

jobrole_attrition = (
    df.groupby("JobRole")["Attrition"]
    .apply(lambda x: (x == "Yes").mean() * 100)
    .round(2)
    .sort_values(ascending=False)
)

print("\nJob Role-wise Attrition Rate:")
print(jobrole_attrition)


# ============================================================
# 06. Overtime-wise Attrition Rate
# ============================================================

overtime_attrition = (
    df.groupby("OverTime")["Attrition"]
    .apply(lambda x: (x == "Yes").mean() * 100)
    .round(2)
    .sort_values(ascending=False)
)

print("\nOvertime-wise Attrition Rate:")
print(overtime_attrition)


# ============================================================
# 07. Income Band
# ============================================================

df["Income_Band"] = pd.cut(
    df["MonthlyIncome"],
    bins=[0, 3000, 6000, float("inf")],
    labels=["Low", "Medium", "High"],
    right=False
)

income_attrition = (
    df.groupby("Income_Band", observed=True)["Attrition"]
    .apply(lambda x: (x == "Yes").mean() * 100)
    .round(2)
    .sort_values(ascending=False)
)

print("\nIncome Band-wise Attrition Rate:")
print(income_attrition)


# ============================================================
# 08. Age Band
# ============================================================

df["Age_Band"] = pd.cut(
    df["Age"],
    bins=[0, 25, 35, 45, 55, float("inf")],
    labels=["Under 25", "25-34", "35-44", "45-54", "55+"],
    right=False
)

age_attrition = (
    df.groupby("Age_Band", observed=True)["Attrition"]
    .apply(lambda x: (x == "Yes").mean() * 100)
    .round(2)
)

print("\nAge Band-wise Attrition Rate:")
print(age_attrition)


# ============================================================
# 09. Tenure Band
# ============================================================

df["Tenure_Band"] = pd.cut(
    df["YearsAtCompany"],
    bins=[-1, 1, 3, 5, 10, float("inf")],
    labels=["0-1 Years", "2-3 Years", "4-5 Years", "6-10 Years", "10+ Years"]
)

tenure_attrition = (
    df.groupby("Tenure_Band", observed=True)["Attrition"]
    .apply(lambda x: (x == "Yes").mean() * 100)
    .round(2)
)

print("\nTenure Band-wise Attrition Rate:")
print(tenure_attrition)


# ============================================================
# 10. Business Travel-wise Attrition Rate
# ============================================================

travel_attrition = (
    df.groupby("BusinessTravel")["Attrition"]
    .apply(lambda x: (x == "Yes").mean() * 100)
    .round(2)
    .sort_values(ascending=False)
)

print("\nBusiness Travel-wise Attrition Rate:")
print(travel_attrition)


# ============================================================
# 11. Job Satisfaction-wise Attrition Rate
# ============================================================

job_satisfaction = (
    df.groupby("JobSatisfaction")["Attrition"]
    .apply(lambda x: (x == "Yes").mean() * 100)
    .round(2)
)

print("\nJob Satisfaction-wise Attrition Rate:")
print(job_satisfaction)


# ============================================================
# 12. Environment Satisfaction-wise Attrition Rate
# ============================================================

environment_satisfaction = (
    df.groupby("EnvironmentSatisfaction")["Attrition"]
    .apply(lambda x: (x == "Yes").mean() * 100)
    .round(2)
)

print("\nEnvironment Satisfaction-wise Attrition Rate:")
print(environment_satisfaction)


# ============================================================
# 13. Work-Life Balance-wise Attrition Rate
# ============================================================

worklife_balance = (
    df.groupby("WorkLifeBalance")["Attrition"]
    .apply(lambda x: (x == "Yes").mean() * 100)
    .round(2)
)

print("\nWork-Life Balance-wise Attrition Rate:")
print(worklife_balance)


# ============================================================
# 14. Education Field-wise Attrition Rate
# ============================================================

education_field = (
    df.groupby("EducationField")["Attrition"]
    .apply(lambda x: (x == "Yes").mean() * 100)
    .round(2)
    .sort_values(ascending=False)
)

print("\nEducation Field-wise Attrition Rate:")
print(education_field)


# ============================================================
# 15. Gender-wise Attrition Rate
# ============================================================

gender_attrition = (
    df.groupby("Gender")["Attrition"]
    .apply(lambda x: (x == "Yes").mean() * 100)
    .round(2)
    .sort_values(ascending=False)
)

print("\nGender-wise Attrition Rate:")
print(gender_attrition)


# ============================================================
# 16. Job Involvement-wise Attrition Rate
# ============================================================

job_involvement = (
    df.groupby("JobInvolvement")["Attrition"]
    .apply(lambda x: (x == "Yes").mean() * 100)
    .round(2)
)

print("\nJob Involvement-wise Attrition Rate:")
print(job_involvement)


# ============================================================
# 17. Marital Status-wise Attrition Rate
# ============================================================

marital_status = (
    df.groupby("MaritalStatus")["Attrition"]
    .apply(lambda x: (x == "Yes").mean() * 100)
    .round(2)
    .sort_values(ascending=False)
)

print("\nMarital Status-wise Attrition Rate:")
print(marital_status)


# ============================================================
# 18. Distance From Home-wise Attrition Rate
# ============================================================

distance_attrition = (
    df.groupby("DistanceFromHome")["Attrition"]
    .apply(lambda x: (x == "Yes").mean() * 100)
    .round(2)
    .sort_values(ascending=False)
)

print("\nDistance From Home-wise Attrition Rate:")
print(distance_attrition)


# ============================================================
# 19. Years With Current Manager
# ============================================================

manager_attrition = (
    df.groupby("YearsWithCurrManager")["Attrition"]
    .apply(lambda x: (x == "Yes").mean() * 100)
    .round(2)
)

print("\nYears With Current Manager Attrition Rate:")
print(manager_attrition)


# ============================================================
# 20. Years In Current Role
# ============================================================

current_role_attrition = (
    df.groupby("YearsInCurrentRole")["Attrition"]
    .apply(lambda x: (x == "Yes").mean() * 100)
    .round(2)
)

print("\nYears In Current Role Attrition Rate:")
print(current_role_attrition)


# ============================================================
# 21. Years Since Last Promotion
# ============================================================

promotion_attrition = (
    df.groupby("YearsSinceLastPromotion")["Attrition"]
    .apply(lambda x: (x == "Yes").mean() * 100)
    .round(2)
)

print("\nYears Since Last Promotion Attrition Rate:")
print(promotion_attrition)


# ============================================================
# 22. Key Business Findings
# ============================================================

print("\n" + "=" * 60)
print("KEY BUSINESS FINDINGS")
print("=" * 60)

overall_rate = (
    df["Attrition"]
    .eq("Yes")
    .mean()
    * 100
)

print(f"\nOverall Attrition Rate: {overall_rate:.2f}%")

print(
    f"Highest Department Attrition: "
    f"{department_attrition.index[0]} "
    f"({department_attrition.iloc[0]:.2f}%)"
)

print(
    f"Highest Job Role Attrition: "
    f"{jobrole_attrition.index[0]} "
    f"({jobrole_attrition.iloc[0]:.2f}%)"
)

print(
    f"Highest Overtime Attrition: "
    f"{overtime_attrition.index[0]} "
    f"({overtime_attrition.iloc[0]:.2f}%)"
)

print(
    f"Highest Age Band Attrition: "
    f"{age_attrition.idxmax()} "
    f"({age_attrition.max():.2f}%)"
)

print(
    f"Highest Tenure Band Attrition: "
    f"{tenure_attrition.idxmax()} "
    f"({tenure_attrition.max():.2f}%)"
)


# ============================================================
# End of Analysis
# ============================================================

print("\nHR Analytics Python analysis completed successfully.")
