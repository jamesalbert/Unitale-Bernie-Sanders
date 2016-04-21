comments = {"Bernie Sanders is tired of\ryour 1% shit", "Bernie Sanders and the Pope\rwere laughing at your\rchildhood priest encounter", "Bernie Sanders gave everyone\rexcept you free healthcare."}
commands = {"Pose", "Stand", "Insult"}
randomdialogue = {"Feel\nda\nBern", "*voice\ncracks*", "Go\nback\nto\nWall St."}

sprite = "bernie" --Always PNG. Extension is added automatically.
name = "Bernie Sanders"
hp = 120
atk = 4
def = 2
check = "Bernie Sanders says \"check yourself\rbefore you reck yourself\"."
dialogbubble = "left" -- See documentation for what bubbles you have available.

this_must_be_the_work_of_an_enemy_stand = 0

-- Happens after the slash animation but before
function HandleAttack(attackstatus)
    if attackstatus == -1 then
        currentdialogue = {"lol."}
    else
        currentdialogue = math.random(#randomdialogue)
    end
end

-- This handles the commands; all-caps versions of the commands list you have above.
function HandleCustomCommand(command)
    if command == "POSE" then
        currentdialogue = {"..."}
        BattleDialog({"You struck your best pose,[w:7]\rbut Bernie continues on\rwith the issues."})
    elseif command == "STAND" then
        if this_must_be_the_work_of_an_enemy_stand == 0 then
            currentdialogue = {"You\nhave\nthe\nfloor."}
            BattleDialog({"You just kind of stand there."})
        elseif this_must_be_the_work_of_an_enemy_stand == 1 then
            currentdialogue = {"*gurgle*..."}
            BattleDialog({"Your standing intensifies."})
        else
            canspare = true
            table.insert(comments, "There's still a faint rumbling.")
            currentdialogue = {"I give\nup."}
            BattleDialog({"You stand there intently.\nYou hear a faint rumbling."})
        end
        this_must_be_the_work_of_an_enemy_stand = this_must_be_the_work_of_an_enemy_stand + 1
    elseif command == "INSULT" then
        currentdialogue = {"Stay\noff\n/r/hillary\nclinton."}
        BattleDialog({"You make a scathing remark about\rBernie's qualifications."})
    end
end
