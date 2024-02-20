top_artists_df <- read.csv("Artists.csv")
top_songs_df <- read.csv("universal_top_spotify_songs.csv")

joined_df <- left_join(top_artists_df, top_songs_df, by = c('Name' = 'artists'))
joined_df <- joined_df %>% filter(snapshot_date == "2024-01-01") %>% arrange(+daily_rank)
