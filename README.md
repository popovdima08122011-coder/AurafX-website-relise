# AuraFX Visuals website

Static website for AuraFX Visuals. The download is the Windows installer that creates the AuraFX Minecraft profile; the site presents the visuals as the product.

## Local preview

1. Serve this folder over `http://localhost:4173` by running `serve.ps1`.
2. The sign-in button needs a Google OAuth client of type **Web application**. Set its public client ID in `config.js` and authorize the exact site origin in Google Cloud Console.
3. Configure the API Worker with `SITE_GOOGLE_CLIENT_ID`, `SITE_ALLOWED_ORIGINS`, and `SITE_RP_ID`; apply `backend/migrations/0012_site_auth.sql` before using account sessions and passkeys.
4. Set `apiBaseUrl` in `config.js` to the Worker URL. The included download is `downloads/AuraFX Launcher 1.7.9 Setup.exe`.

A blank Google Web Client ID intentionally does not authenticate users. The browser cannot safely create or infer a Google OAuth client ID, and the launcher's Desktop OAuth client is not a substitute for a website client.

## Production

Choose the final HTTPS domain first. Authorize that origin for the Google Web OAuth client, set its client ID in `config.js` and the Worker variable `SITE_GOOGLE_CLIENT_ID`, set `SITE_ALLOWED_ORIGINS` to the exact HTTPS origin, and set `SITE_RP_ID` to the hostname. Apply the site-auth D1 migration and deploy the Worker. Passkeys are tied to the hostname, so choose it before enrollment.

The site does not contain license keys or key-seed files. License activation remains handled by the launcher backend.
