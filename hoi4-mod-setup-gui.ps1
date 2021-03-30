Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

$window = New-Object System.Windows.Forms.Form
$window.Width = 600
$window.Height = 400
$window.AutoSize = $true
$window.Text = "Hearts of Iron IV Mod Infrastructor" 

$Label1 = New-Object System.Windows.Forms.Label
$Label1.Location = New-Object System.Drawing.Point(10,10)
$Label1.AutoSize = $true
$Label1.Text = "Mod Folder Location:"
$window.Controls.Add($Label1)

$Button1 = New-Object System.Windows.Forms.Button
$Button1.Text = "Select"
$Button1.AutoSize = $true
$Button1.Location = New-Object System.Drawing.Point(520,28)
$window.Controls.Add($Button1)

$TextBox1 = New-Object System.Windows.Forms.TextBox
$TextBox1.Location = New-Object System.Drawing.Point(10,30)
$TextBox1.Width = 500
$TextBox1.Height = $Button1.Height
$TextBox1.AutoSize = $true
$TextBox1.Enabled = $false
$window.Controls.Add($TextBox1)

$Label2 = New-Object System.Windows.Forms.Label
$Label2.Location = New-Object System.Drawing.Point(10,55)
$Label2.AutoSize = $true
$Label2.Text = "Example: C:\Users\coolr\OneDrive\Document\Paradox Interactive\Hearts of Iron IV\mod\test"
$window.Controls.Add($Label2)

$Groupbox = New-Object System.Windows.Forms.GroupBox
$Groupbox.Location = New-Object System.Drawing.Point(5,80)
$Groupbox.AutoSize = $true
$Groupbox.Text = "Templates"
$window.Controls.Add($Groupbox)

$Checkbox1 = New-Object System.Windows.Forms.CheckBox
$Checkbox1.Text = "AI"
$Checkbox1.AutoSize = $true
$Checkbox1.Location = New-Object System.Drawing.Point(10,20)
$Groupbox.Controls.Add($Checkbox1)

$Checkbox2 = New-Object System.Windows.Forms.CheckBox
$Checkbox2.Text = "Countries"
$Checkbox2.AutoSize = $true
$Checkbox2.Location = New-Object System.Drawing.Point(10,40)
$Groupbox.Controls.Add($Checkbox2)

$Checkbox3 = New-Object System.Windows.Forms.CheckBox
$Checkbox3.Text = "Decisions"
$Checkbox3.AutoSize = $true
$Checkbox3.Location = New-Object System.Drawing.Point(10,60)
$Groupbox.Controls.Add($Checkbox3)

$Checkbox4 = New-Object System.Windows.Forms.CheckBox
$Checkbox4.Text = "Events"
$Checkbox4.AutoSize = $true
$Checkbox4.Location = New-Object System.Drawing.Point(10,80)
$Groupbox.Controls.Add($Checkbox4)

$Checkbox5 = New-Object System.Windows.Forms.CheckBox
$Checkbox5.Text = "Flags"
$Checkbox5.AutoSize = $true
$Checkbox5.Location = New-Object System.Drawing.Point(10,100)
$Groupbox.Controls.Add($Checkbox5)

$Checkbox11 = New-Object System.Windows.Forms.CheckBox
$Checkbox11.Text = "Graphics"
$Checkbox11.AutoSize = $true
$Checkbox11.Location = New-Object System.Drawing.Point(10,120)
$Groupbox.Controls.Add($Checkbox11) 

$Checkbox6 = New-Object System.Windows.Forms.CheckBox
$Checkbox6.Text = "Map"
$Checkbox6.AutoSize = $true
$Checkbox6.Location = New-Object System.Drawing.Point(10,140)
$Groupbox.Controls.Add($Checkbox6)

$Checkbox7 = New-Object System.Windows.Forms.CheckBox
$Checkbox7.Text = "National Focuses"
$Checkbox7.AutoSize = $true
$Checkbox7.Location = New-Object System.Drawing.Point(10,160)
$Groupbox.Controls.Add($Checkbox7)

$Checkbox8 = New-Object System.Windows.Forms.CheckBox
$Checkbox8.Text = "Ideas"
$Checkbox8.AutoSize = $true
$Checkbox8.Location = New-Object System.Drawing.Point(10,180)
$Groupbox.Controls.Add($Checkbox8)

$Checkbox9 = New-Object System.Windows.Forms.CheckBox
$Checkbox9.Text = "States"
$Checkbox9.AutoSize = $true
$Checkbox9.Location = New-Object System.Drawing.Point(10,200)
$Groupbox.Controls.Add($Checkbox9)

$Checkbox10 = New-Object System.Windows.Forms.CheckBox
$Checkbox10.Text = "Technology"
$Checkbox10.AutoSize = $true
$Checkbox10.Location = New-Object System.Drawing.Point(10,220)
$Groupbox.Controls.Add($Checkbox10)

$Checkbox2.Add_Click(
{
    if($Checkbox2.Checked -eq $true)
    {
        $Checkbox3.Checked = $true
        $Checkbox4.Checked = $true
        $Checkbox5.Checked = $true
        $Checkbox7.Checked = $true
        $Checkbox8.Checked = $true
        $Checkbox9.Checked = $true
    }else
        {
            $Checkbox3.Checked = $false
            $Checkbox4.Checked = $false
            $Checkbox5.Checked = $false
            $Checkbox7.Checked = $false
            $Checkbox8.Checked = $false
            $Checkbox9.Checked = $false
        }
}
)


$Button2 = New-Object System.Windows.Forms.Button
$Button2.Text = "Run"
$Button2.AutoSize = $true
$Button2.Location = New-Object System.Drawing.Point(250,325)
$window.Controls.Add($Button2)


$Button1.Add_Click(
{
    $Browser = New-Object System.Windows.Forms.FolderBrowserDialog
    $Browser.RootFolder = "MyComputer"
    $Browser.ShowDialog()

    $Folder = $Browser.SelectedPath
    $TextBox1.AppendText($Folder)
}
)
$Button2.Add_Click(
{
     if($TextBox1.Text)
     {
        $Key_input = $TextBox1.Text
        Set-Location -Path $Key_input

        if($Checkbox1.Checked -eq $true)
        {
            New-Item -Name common -ItemType directory  
            Set-Location -Path common
            New-Item -Name ai_areas -ItemType directory
            New-Item -Name ai_equipment -ItemType directory
            New-Item -Name ai_focuses -ItemType directory
            New-Item -Name ai_peace -ItemType directory
            New-Item -Name ai_strategy -ItemType directory
            New-Item -Name ai_strategy_plans -ItemType directory
            New-Item -Name ai_templates -ItemType directory
            Set-Location -Path ".."
        }else
            {
            }
    
        if($Checkbox2.Checked -eq $true)
        {
            New-Item -Name history -ItemType directory
            New-Item -Name common -ItemType directory
            New-Item -Name localisation -ItemType directory
            New-Item -Name countries_l_english.yml -ItemType File 
            New-Item -Name countries_cosmetic_l_english.yml -ItemType File
            Set-Location -Path common
            New-Item -Name countries -ItemType directory
            New-Item -Name country_tags -ItemType directory
        Set-Location -Path ".."
        Set-Location -Path history
        New-Item -Name countries -ItemType directory
        New-Item -Name units -ItemType directory
        Set-Location -Path ".."
    }else
        {
        }
    
   if($Checkbox3.Checked -eq $true)
    {
        New-Item -Name common -ItemType directory
        New-Item -Name localisation -ItemType directory
        New-Item -Name decisions_l_english.yml -ItemType File
        Set-Location -Path common
        New-Item -Name decisions -ItemType directory
        Set-Location -Path decisions
        New-Item -Name categories -ItemType directory
        Set-Location -Path ".."
        Set-Location -Path ".."
    }else
        {
        }
        
   if($Checkbox4.Checked -eq $true)
    {
        New-Item -Name events -ItemType directory
        New-Item -Name localisation -ItemType directory
        New-Item -Name events_l_english.yml -ItemType File
    }else
        {
        }
    
   if($Checkbox5.Checked -eq $true)
    {
        New-Item -Name gfx -ItemType directory
        Set-Location -Path gfx
        New-Item -Name flags -ItemType directory
        Set-Location -Path flags
        New-Item -Name medium -ItemType directory
        New-Item -Name small -ItemType directory
        Set-Location -Path ".."
        Set-Location -Path ".."
    }else
        {
        }
    
   if($Checkbox6.Checked -eq $true)
    {
        New-Item -Name map -ItemType directory
        Set-Location -Path map
        New-Item -Name strategicregions -ItemType directory
        New-Item -Name supplyareas -ItemType directory
        New-Item -Name terrain -ItemType directory
        Set-Location -Path ".."
    }else
        {
        }
    
   if($Checkbox7.Checked -eq $true)
    {
        New-Item -Name common -ItemType directory
        New-Item -Name localisation -ItemType directory
        New-Item -Name focus_l_english.yml -ItemType File 
        Set-Location -Path common
        New-Item -Name national_focus -ItemType directory
        Set-Location -Path ".."
    }else
        {
        }
    
   if($Checkbox8.Checked -eq $true)
    {
        New-Item -Name common -ItemType directory
        New-Item -Name localisation -ItemType directory
        New-Item -Name ideas_l_english.yml -ItemType File
        Set-Location -Path common
        New-Item -Name ideas -ItemType directory
        Set-Location -Path ".."
    }else
        {
        }
    
   if($Checkbox9.Checked -eq $true)
    {
        New-Item -Name history -ItemType directory
        Set-Location -Path history
        New-Item -Name states -ItemType directory
        Set-Location -Path ".."
    }else
        {
        }
    
   if($Checkbox10.Checked -eq $true)
    {
        New-Item -Name common -ItemType directory
        New-Item -Name localisation -ItemType directory
        New-Item -Name research_l_english.yml -ItemType File
        Set-Location -Path common
        New-Item -Name technologies -ItemType directory
        New-Item -Name technology_tags -ItemType directory
        Set-Location -Path ".."
    }else
        {
        }
    if($Checkbox11.Checked -eq $true)
    {
        New-Item -Name gfx -ItemType directory
        Set-Location -Path gfx
        New-Item -Name leaders -ItemType directory
        New-Item -Name loadingscreens -ItemType directory
        New-Item -Name event_pictures -ItemType directory
        Set-Location -Path ".."
    }else
        {
        }
    Add-Content -Path *_l_english.yml -Value 'l_english:' -Encoding "utf8"
    $vab = Get-ChildItem -Filter "*.yml" -Recurse 
    $vab | Rename-Item -NewName { $_.Directory.Name+'_'+$_.Name }
    Move-Item "*.yml" -Destination localisation
     }
}
)


$window.ShowDialog()