GEM outline:
every time the user scrapes samples, they're saved permanently in the samples class. the sample class will therefore hold an ever-increasing number of samples that the user can browse, play, download etc. 

CLI:
1. there are x new samples today. how would you like to browse?

 1. browse samples by key
 2. browse samples by tempo
 3. browse samples by number of downloads


2. returns a list of samples sorted in the order chosen - which sample would you like to play (push the number or push and hold the number for continuous play)?

	1. “808 nightmare” - 1A
	2. “mom’s spaghetti” - 1A


3. currently playing “mom's spaghetti” by emin3m

5. type “download” to download the current file, "next" go to the next sample, "back" to go to the previous sample or "list" to return to list view. type "exit" to quit. Or type "creator" to see more from the creator of this sample.

if user types download, download commences,
if user types next, the next track will load
if user types back, the last track will load
if user types creator, a list of all of the creators samples will load


Classes:
sample_scraper class - scrapes samples from a given web page
sample class - creates object given the output from the sample_scraper class (hash of data).        
              - has a name, has a creator, has a title, has a key, has a download_count, has a url, has a bpm
creator class - one creator can have many samples
cli class - runs all the business logic
