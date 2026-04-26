import express from 'express';
import cors from 'cors';
import dotenv from 'dotenv';
import { exec } from 'child_process';
import { promisify } from 'util';

dotenv.config();

const app = express();
const port = process.env.PORT || 3000;

app.use(cors());
app.use(express.json());

const execPromise = promisify(exec);

/**
 * Validates if the provided URL is a valid Facebook URL.
 * This is a crucial security step to prevent command injection.
 */
const isValidFacebookUrl = (url) => {
  // Basic regex to ensure it's a facebook.com URL
  const fbRegex = /^https?:\/\/(www\.)?facebook\.com\/.*$/;
  return fbRegex.test(url);
};

/**
 * Checks for shell metacharacters that could be used for command injection.
 */
const hasShellMetacharacters = (url) => {
  const forbiddenChars = /[;&|><$]/;
  return forbiddenChars.test(url);
};

app.get('/extract', async (req, res) => {
  const { url } = req.query;

  if (!url) {
    return res.status(400).json({ error: 'URL is required' });
  }

  if (!isValidFacebookUrl(url)) {
    return res.status(400).json({ error: 'Invalid Facebook URL. Please provide a valid Facebook link.' });
  }

  if (hasShellMetacharacters(url)) {
    return res.status(400).json({ error: 'Invalid characters detected in URL.' });
  }

  try {
    console.log(`Extracting metadata for: ${url}`);
    
    // Using --dump-json to get all available metadata in a structured format.
    // We wrap the URL in double quotes to handle potential spaces, 
    // although our validation should have stripped anything dangerous.
    const { stdout, stderr } = await execPromise(`yt-dlp --dump-json "${url}"`);
    
    if (stderr && !stdout) {
      return res.status(500).json({ error: 'Error from yt-dlp', details: stderr });
    }

    const metadata = JSON.parse(stdout);
    res.json(metadata);
  } catch (error) {
    console.error('Extraction error:', error);
    res.status(500).json({ 
      error: 'Failed to extract video metadata', 
      details: error.message 
    });
  }
});

app.listen(port, () => {
  console.log(`Backend server running at http://localhost:${port}`);
});
