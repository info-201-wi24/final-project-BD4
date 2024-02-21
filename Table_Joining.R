library(dplyr)
library("stringr")

top_artists_df <- read.csv("Artists.csv")
top_songs_df <- read.csv("universal_top_spotify_songs.csv")

joined_df <- left_join(top_artists_df, top_songs_df, by = c('Name' = 'artists'))
joined_df <- joined_df %>% filter(snapshot_date == "2024-01-01") %>% arrange(+daily_rank)

joined_df <- joined_df %>% mutate(days_since_release = as.Date(snapshot_date) - as.Date(album_release_date))
joined_df <- joined_df %>% mutate(is_single = name == album_name)

summarization_df <- joined_df %>% filter(daily_rank == 1) %>% summarize(avg_rank1_energy = mean(energy))

write.csv(joined_df, "~/Desktop/top_songs_and_country.csv")