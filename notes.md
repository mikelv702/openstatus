# Docker

Starting out by dockerizing the entire project, this long term might not work well....
But we will see what happens. 

## Changes: 

### apps/screenshot-worker/package.json
Needed to change flag to `--local` due to wrangler not being logged in. 

### Dockerfile.dev
Stepping through the dockerfile. 
Started by pulling the NodeJs Docker image
Adding a few environment variables to get `pnpm` operational. 
That is all for the base image. 

We then go to the build phase/image
Here we are installing bun manually using `pnpm install` was not giving us `bun` in the runtime path. 
So we install `bun` first using `pnpm`
Next we install turso. I tried to install turso the same way we installed bun, but it also did not add it to the run time, looking through turso documentation, this is a required step to install the CLI to run a development server. *** Later we should think about moving this to its own dedicated DB ***
Looks like a majority of the application is supposed to be hosted with other applications, and not meant to be standalone/non-cloud deployed... Just my observation and limited knowlledge of NodeJs at this time. 
The script for turo was slightly modified to also run `pnpm install` this was done since tha path for turso was required during this part.
Then exposed the required ports, 
Then created an entry point script which exports the turso path, and starts the application. 

At this time and commit! The application launches and I can reach the login page. But for some reason the database is not playing nice, and I'm unable to login. 


## Database issues
Currently my thoughts are to create two docker files one for database and the other for the application. 
So I can run locally. 
Then I can run a turso DB on 8080 and the application can connect? 
