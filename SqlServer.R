library(DBI)

con <- dbConnect(odbc::odbc(), 
                 .connection_string = 'driver={SQL Server};server=<Server>;database=<Name>;trusted_connection=true')

dbWriteTable(con, "mtcars", mtcars)
dbListTables(con)

dbListFields(con, "mtcars")
dbReadTable(con, "mtcars")

res <- dbSendQuery(con, "SELECT * FROM mtcars WHERE cyl = 4")
dbFetch(res)
dbClearResult(res)

# Or a chunk at a time
res <- dbSendQuery(con, "SELECT * FROM mtcars WHERE cyl = 4")
while(!dbHasCompleted(res)){
  chunk <- dbFetch(res, n = 5)
  print(nrow(chunk))
}
dbClearResult(res)

dbDisconnect(con)

