Create a dbt Project:

Navigate to the directory where you want to create your dbt project and run:e
dbt init my_dbt_project

Replace my_dbt_project with your desired project name. This command creates a new dbt project with a default structure.

Configure Snowflake Connection:

Navigate to your dbt project directory and edit the profiles.yml file. This file is typically located in the ~/.dbt/ directory. If it doesn't exist, create it.

Example profiles.yml configuration:

my_dbt_project:
  target: dev
  outputs:
    dev:
      type: snowflake
      account: your_snowflake_account
      user: your_snowflake_username
      password: your_snowflake_password
      role: your_snowflake_role
      warehouse: your_snowflake_warehouse
      database: your_snowflake_database
      schema: your_snowflake_schema
      threads: 1
      client_session_keep_alive: False

Replace your_snowflake_account, your_snowflake_username, your_snowflake_password, etc., with your Snowflake credentials.
Ensure the schema you specify is where dbt will create tables/views.

3. Create dbt Models
Navigate to Your dbt Project Directory:

cd my_dbt_project

Define a Model:

Create a new file in the models directory of your dbt project. For example, to create a simple model, add a file named my_model.sql with the following content:


select
  id,
  name,
  created_at
from
  raw_data_table

This SQL query defines a model that selects data from raw_data_table.

Configure Model Properties:

Edit the dbt_project.yml file to configure model properties if needed. Example configuration:


name: 'my_dbt_project'
version: '1.0'
config-version: 2

models:
  my_dbt_project:
    +materialized: view  # Options: table, view, incremental, ephemeral

4. Run dbt Commands
Run dbt to Build Models:

Execute the following command to build your models:


dbt run
This command will execute the SQL in your models and create the corresponding tables/views in Snowflake.

Check dbt Model Status:

You can check the status of your dbt run by executing:

dbt run --models my_model
Replace my_model with the name of your model.

Test dbt Models:

To run tests on your models, you can use:

dbt test

Ensure you have defined tests in your tests directory or inline within your model files.
