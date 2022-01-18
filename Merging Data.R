##### generating and Loading Data ######
table1 <- data.frame(P_ID = c(1:8),
                     gender = c("male", "male", "female", "female",
                                "female", "male", "female", "male"),
                     height = c(71,73,64,64,66,69,62,72),
                     weight = c(175,225,130,125,165,160,115,250))

table2 <- data.frame(P_ID = c(1,2,4,5,7,8,9,10),
                     sex= c("male", "male", "female", "female",
                            "female", "male", "male", "female"),
                     visits = c(1,2,4,12,2,2,1,1),
                     checkup = c(1,1,1,1,1,1,0,0),
                     follow_up = c(0,0,1,2,0,0,0,0),
                     illness = c(0,0,2,7,1,1,0,0),
                     surgery = c(0,0,0,2,0,0,0,0),
                     ER = c(0,1,0,0,0,0,1,1))

## So when you are joining or merging data, you should have atleast one column in comman
## mainly a unique identifier like an ID

combine_data <- merge(table1,            # first data frame
                      table2,            # seond data frame
                      by = "P_ID")       # comman column to merge on

# so the combine_data has 6 records which are comman to both
# by default, merge performs inner join

################ Joins ####################

## A left join keeps all the key values in the first (left) data frame
left_join <- merge(table1,
                   table2,
                   by = "P_ID",
                   all.x = T)           # keep all key values in x?

## A right join keeps all the key values in the second (right) data frame
right_join <- merge(table1,
                    table2,
                    by = "P_ID",
                    all.y = T)

## an outer join keeps all key values in both the data frame
outer_join <- merge(table1,
                    table2,
                    by = "P_ID",
                    all = T)
b

#############################################################################
## performing merge on two columns/variables where varnames are different

combine2 <- merge(table1,
                  table2,
                  by.x = c("P_ID", "gender"),
                  by.y = c("P_ID", "sex"),
                  all = T)

## explore the dplyr library for more functions on joins






