

# Eloi Lab WoW Addon  

A laboratory of Lua code in an addon for World of Warcraft to experiment with extracting game data.  

This addon contains two main components:  
- Code to extract data from the game for bot creation.  
- Code to collect and stack information on bots you encounter, allowing you to report them via QR codes, color coding, or copy-paste methods.  

### Goals:  
- I am a white hat; I do this purely for fun and educational purposes.  
  - My aim is to allow young developers to learn coding by creating bots in WoW.  
  - To teach aspiring anti-bot developers how to fight bots using bots.  

### Installation:  
1. Navigate to:  
   `C:\Program Files (x86)\World of Warcraft\_retail_\Interface\AddOns`  
2. Run if you have git (or unzip if you don't):  
   ```sh
   git clone https://github.com/EloiStree/2024_01_18_EloiLabWowAddon.git "C:\Program Files (x86)\World of Warcraft\_classic_era_\Interface\AddOns\EloiLab"
   git clone https://github.com/EloiStree/2024_01_18_EloiLabWowAddon.git "C:\Program Files (x86)\World of Warcraft\_retail_\Interface\AddOns\EloiLab"
   ```  
3. This works for both retail and classic hardcore modes. (Ping me on [Discord](https://discord.gg/WnmXsXHbSn) if something is broken.)

**BIG WARNING:**
Blizzard has banned some of my bots that were linked by IP. I also suspect, and have heard, that they use hardware components to create a fingerprint of your computer, allowing them to analyze and monitor botters.

If you are botting for educational purposes or to study and counteract bots, do so behind a VPN with a virtual machine hosted on a separate PC. It's best not to take risks for you main account that has 1,000+ hours on it.

If you want to learn without risking your account, just ask me to launch a client on my Discord, and you can learn remotely from a safe distance.

## How to use ?
**Will probably change when I clean the code.**

``` lua 

SLASH_ELOILABLIST1 = "/elhelp";
function SlashCmdList.ELOILABLIST(msg)

    ELP.Print("Read me: https://github.com/EloiStree/HelloWarcraftQAXR");
    ELP.EndLine("- /elwrite : write a note to keep between players");
    ELP.EndLine("- /elread : read a note to keep between players");
    ELP.EndLine("- /elshow : show info");
    ELP.EndLine("- /elhide : hide info");
    ELP.EndLine("- /elserver eu|us|?? : Set the server you are on for link generation");
    ELP.EndLine("- /elplayerinfoappend : Append in the clipboard information about the target and mouseover")
    ELP.EndLine("- /elplayerinfo : Set in the clipboard information about the target and mouseover")
    ELP.EndLine("- /elrtfm: Give links to \"Read the fucking manual\". :)- ")
    
end

```

You can use: 
- You have to set the server localisation because it is not in the public API
  - `/elserver eu` to set that you are on a EU server
  - `/elserver us` to set that you are on a US server
- Now you can create a macro to save the current bot or bots information when you see one.
  - `/elplayerinfo` to set the information on the bot you want to report
  - `/elplayerinfoappend` to append the information on the bots you want to report


**Anti-Bot idea & Blizzard Team:**

To the Blizzard team reading this Git:
I will not remove my code if requested because I believe that teaching people how bots work is the best way to learn how to combat them. My goal is to inspire new talent with a passion for coding anti-bot solutions.

I hope the team take this as an opportunity to discover skilled individuals who may be interested in helping you fight bots.

I invite you to reach out if you'd like to discuss ideas on how we can tackle this issue together:
[https://github.com/EloiStree/HelloWarcraftQAXR/issues?q=Anti-Bot%3A%20](https://github.com/EloiStree/HelloWarcraftQAXR/issues?q=Anti-Bot%3A%20)  

Kind regards,
Eloi


-------------------

**Curse Forge link (if validated in futur)**:  
https://legacy.curseforge.com/wow/addons/eloi-lab-lets-fight-bots-with-bots  

