#include <sourcemod>

int RoundCount = 0;
   ConVar CV_MaxRound;

public void OnPluginStart()
{
    HookEvent("round_end", Event_RoundEnd); 
}

public void OnMapStart()
{
    RoundCount = 0;
 
	CV_MaxRound = FindConVar("mp_maxrounds");
}

public Action Event_RoundEnd(Event event, const char[] name, bool dontBroadcast)
{
    RoundCount++;
    if(RoundCount >= (CV_MaxRound.IntValue > 28 ? 28 : CV_MaxRound.IntValue - 1))
    {
        ServerCommand("mp_restartgame 1");
        RoundCount = 0;
        }
    
    return Plugin_Continue; 
} 