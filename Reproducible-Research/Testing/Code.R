## Configuration
library(ggplot2) # used in last point

## Loading and preprocessing the data

# Requeriments
#
# 1. Load the data 
# 2. Process/transform the data (if necessary) into a format suitable for your analysis

# 1 & 2: Read input file and convert "date" field into date format.
in_data = read.csv("./Testing/activity.csv", stringsAsFactors = FALSE)
in_data$date = as.Date(in_data$date, format = "%Y-%m-%d")
head(in_data)
str(in_data)



## What is mean total number of steps taken per day?

# Requeriments
#
# 1. Make a histogram of the total number of steps taken each day
# 2. Calculate and report the mean and median total number of steps taken per day
#

# 1.
# Calculate and plot: total number of steps per day.
# Missing values: ignored by using "na.rm = TRUE"
# For days where all the data is NA, it will return NA for both mean and median.
total_steps_by_day = aggregate(steps ~ date, data = in_data, sum, na.rm=TRUE)
plot(total_steps_by_day, type="h", main="Toal Steps By Day", col="blue")


# 2.
# Calculate: mean and median for the number of steps per day.
mean_steps_by_day = mean(total_steps_by_day$steps)
median_steps_day = median(total_steps_by_day$steps)
hist(total_steps_by_day$steps, breaks=20, main="Histogram of Steps per Day")
#sprintf("Number of steps taken each day > Mean   = , %.1f",mean_steps_by_day)
#sprintf("Number of steps taken each day > Median = , %.1f",median_steps_day)



## What is the average daily activity pattern

# Requeriments
#
# 1. Make a time series plot (i.e. type = "l") of the 5-minute interval (x-axis) and 
#   the average number of steps taken, averaged across all days (y-axis)
# 2. Which 5-minute interval, on average across all the days in the dataset, contains 
#    the maximum number of steps?
#

# 1.
# Calculate the average number of steps by time interval, then plot the graph.
average_steps_interval = aggregate(steps ~ interval, data=in_data, mean)
plot(average_steps_interval, type = "l", main = "Average Steps by 5-Minute Interval", col = "blue")

# 2.
# Finding the 5-minute interval, on average across all the days in the dataset, that contains 
# the maximum number of steps.
average_steps_interval[which.max(average_steps_interval$steps),]


## Imputing missing values

# Requeriments
#
# 1. Calculate and report the total number of missing values in the dataset (i.e. the total number of rows with NAs)   
# 2. Devise a strategy for filling in all of the missing values in the dataset. 
#    The strategy does not need to be sophisticated. 
#    For example, you could use the mean/median for that day, or the mean for that 5-minute interval, etc   
# 3. Create a new dataset that is equal to the original dataset but with the missing data filled in.
# 4. Make a histogram of the total number of steps taken each day and Calculate and report the mean and median total 
#    number of steps taken per day. 
#    Do these values differ from the estimates from the first part of the assignment? 
#    What is the impact of imputing missing data on the estimates of the total daily number of steps?
# 

# 1.
# Number of rows with steps = NA
sum(is.na(in_data$steps))
merged_data = merge(in_data, average_steps_interval, by="interval")
names(merged_data) = c("interval", "original_steps", "date", "average_steps")
merged_data$filled_steps = ifelse(is.na(merged_data$original_steps), merged_data$average_steps, merged_data$original_steps)

# Checking total number of steps by day
filled_steps_by_day <- aggregate(filled_steps ~ date, data=merged_data, sum)

mean(filled_steps_by_day$filled_steps)
median(filled_steps_by_day$filled_steps)
hist(filled_steps_by_day$filled_steps, breaks=20, main="Histogram of Steps per Day with Filled Data")


## Are there differences in activity patterns between weekdays and weekends?

# Requeriments
#
# 1. Create a new factor variable in the dataset with two levels -- "weekday" and "weekend" indicating whether a given 
#    date is a weekday or weekend day. 
#   
# 2. Make a panel plot containing a time series plot (i.e. type = "l") of the 5-minute interval (x-axis) and the average 
#    number of steps taken, averaged across all weekday days or weekend days (y-axis). 
#    The plot should look something like the following, which was created using simulated data
#    

merged_data$day_of_week = weekdays(as.Date(merged_data$date))
merged_data$weekend = as.factor(ifelse(merged_data$day_of_week %in% c("sabado", "domingo"), "weekend", "weekday"))
weekend_data = aggregate(filled_steps ~ interval + weekend, data=merged_data, mean)

# Graph differences
ggplot(weekend_data,aes(interval,filled_steps)) + 
  geom_line() + 
  facet_grid(.~weekend) + 
  labs(title = "Differences Between Weekend and Weekdays") + 
  labs(x = "5-Minute Interval Number", y = "Average Steps")






