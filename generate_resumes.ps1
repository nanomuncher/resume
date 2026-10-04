$baseDir = "C:\Users\Admin\.gemini\antigravity\scratch\resume"

function Create-Html {
    param(
        [string]$RoleTitle,
        [string]$CssPath,
        [string]$Skills,
        [string]$ExperienceHtml,
        [string]$OutputPath
    )

    $html = @"
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Olan L. Lasquety - $RoleTitle</title>
    <meta name="description" content="Resume of Olan L. Lasquety, $RoleTitle.">
    <meta name="robots" content="noindex, nofollow">
    <link rel="stylesheet" href="$CssPath">
</head>
<body>
    <div class="sheet">
        <header>
            <h1>Olan L. Lasquety</h1>
            <p class="role">$RoleTitle</p>
            <div class="contact">
                <span>📍 Philippines</span>
                <span>✉️ <a href="mailto:lasquetyolanbsn@gmail.com">lasquetyolanbsn@gmail.com</a></span>
                <span>📞 +639186526120</span>
                <span>🔗 <a href="https://lasquetyolan.carrd.co">lasquetyolan.carrd.co</a></span>
            </div>
        </header>
        
        <section class="skills">
            <h2>Skills</h2>
            <p class="skills-list">$Skills</p>
        </section>

        <section class="experience">
            <h2>Work Experience</h2>
$ExperienceHtml
        </section>
        
        <section class="education">
            <h2>Education</h2>
            <div class="education-entry">
                <div class="edu-header">
                    <span class="edu-school">Manuel S. Enverga University Foundation, mseuf.edu.ph</span>
                    <span class="edu-date">Aug 2019 – Jun 2023</span>
                </div>
                <div>Bachelor Of Science in Entertainment and Multimedia Computing</div>
            </div>
        </section>
    </div>
</body>
</html>
"@
    
    $dir = Split-Path $OutputPath
    if (-not (Test-Path $dir)) {
        New-Item -ItemType Directory -Force -Path $dir | Out-Null
    }
    
    [System.IO.File]::WriteAllText($OutputPath, $html, [System.Text.Encoding]::UTF8)
}

function Get-JobBlock {
    param(
        [string]$Title,
        [string]$Company,
        [string]$Date,
        [string[]]$Bullets
    )
    
    $liItems = ($Bullets | ForEach-Object { "                    <li>$_</li>" }) -join "`n"
    
    return @"
            <div class="job">
                <div class="job-header">
                    <span class="job-title">$Title, <span class="job-company">$Company</span></span>
                    <span class="job-date">$Date</span>
                </div>
                <ul class="job-list">
$liItems
                </ul>
            </div>
"@
}

$freelance = @{
    Title = "Independent Contractor, Freelance Multimedia Artist"
    Company = "Philippines (Contract, Project Based, Full-Time & Part-Time)"
    Date = "Jul 2023 – present"
    Bullets = @(
        "Delivered high-impact visual content—including ads, posters, logos, and product mockups—for both local and international brands, designed to maximize engagement and brand visibility.",
        "Specialized in content creation for social media, producing scroll-stopping graphics and layouts tailored for streamers, startups, and corporate clients.",
        "Managed end-to-end social media content strategy for a startup, including planning, design, and execution, resulting in increased reach and audience interaction.",
        "Produced engaging short-form video content aligned with content calendars and brand messaging, covering pre-production, shooting, and post-production.",
        "Collaborated as a Project-Based Freelance Video Editor for YCP (Mar 2024 – Apr 2025), creating branded video content, short-form edits, and marketing assets for high-profile clients including SM Supermalls, Milo Cambodia, and Close-Up Thailand, contributing to increased impressions and audience engagement."
    )
}

$bizforce = @{
    Title = "Multimedia Designer"
    Company = "BizForce - Philippines & USA Remote (Full-Time)"
    Date = "Feb 2026 – Present"
    Bullets = @(
        "Led visual rebranding initiatives across digital and print platforms, creating cohesive brand systems, marketing assets, and design guidelines that strengthened brand identity and consistency.",
        "Produced high-performing multimedia content including VSL support visuals, short-form video ads, social media creatives, and internal communication materials tailored for engagement and conversion.",
        "Designed print-ready and physical marketing materials such as event collateral, business card, letterheads and promotional assets while ensuring production accuracy and visual quality across formats."
    )
}

$payong = @{
    Title = "Head of Product, AI & Brand Strategy"
    Company = "Payong - Philippines (Part-Time)"
    Date = "Apr 2026 – Present"
    Bullets = @(
        "Led product strategy and cross-functional execution for AI-driven digital solutions, aligning product development with business goals, user needs, and market opportunities.",
        "Managed marketing initiatives, brand positioning, and growth campaigns across digital platforms while coordinating stakeholder communication and business development efforts.",
        "Oversaw quality assurance processes, workflow optimization, and product testing to ensure reliable user experiences, operational efficiency, and high delivery standards."
    )
}

$silong = @{
    Title = "Creative Director & Vice President"
    Company = "Silong Strategies (Part-Time)"
    Date = "May 2025 – Present | Philippines"
    Bullets = @(
        "Built the company’s brand from the ground up, leading identity creation, creative systems, and strategic market positioning to support early-stage business growth.",
        "Led creative and marketing initiatives through the development of high-impact visual assets and campaign materials for digital marketing, investor communications, and business presentations.",
        "Contributed to executive decision-making, growth planning, and overall company strategy in a leadership capacity as acting Vice President."
    )
}

$eclerx = @{
    Title = "Analyst Graphic Artist"
    Company = "eClerx - Philippines"
    Date = "Sep 2024 – Nov 2024"
    Bullets = @(
        "Crafted visually engaging custom stationery, greeting, and celebration cards for Minted, leveraging Adobe Illustrator to develop and refine vector-based artwork and typography.",
        "Executed end-to-end prepress workflows—applying color management, layout verification, and quality control—to ensure flawless, print-ready designs.",
        "Partnered with customers and internal teams to address inquiries, integrate feedback, and balance aesthetic vision with technical production requirements."
    )
}

$cambridge = @{
    Title = "Multimedia Intern"
    Company = "Cambridge University Press & Assessment - cambridge.org"
    Date = "Feb 2023 – Jun 2023"
    Bullets = @(
        "Designed marketing and event materials including tarpaulins, layouts, and digital graphics to support internal and external communications.",
        "Edited video content and provided event coverage, contributing to cohesive multimedia storytelling across platforms.",
        "Managed content flow for shared online assets, ensuring timely and organized publishing across digital channels."
    )
}

# --- 2. Graphic Design ---
$exp_gd = ""
$exp_gd += Get-JobBlock -Title $eclerx.Title -Company $eclerx.Company -Date $eclerx.Date -Bullets $eclerx.Bullets
$exp_gd += Get-JobBlock -Title $bizforce.Title -Company $bizforce.Company -Date $bizforce.Date -Bullets @($bizforce.Bullets[2], $bizforce.Bullets[0], $bizforce.Bullets[1])
$exp_gd += Get-JobBlock -Title $freelance.Title -Company $freelance.Company -Date $freelance.Date -Bullets @($freelance.Bullets[0], $freelance.Bullets[1], $freelance.Bullets[2], $freelance.Bullets[3], $freelance.Bullets[4])
$exp_gd += Get-JobBlock -Title $silong.Title -Company $silong.Company -Date $silong.Date -Bullets @($silong.Bullets[0], $silong.Bullets[1], $silong.Bullets[2])
$exp_gd += Get-JobBlock -Title $cambridge.Title -Company $cambridge.Company -Date $cambridge.Date -Bullets @($cambridge.Bullets[0], $cambridge.Bullets[2], $cambridge.Bullets[1])
$exp_gd += Get-JobBlock -Title $payong.Title -Company $payong.Company -Date $payong.Date -Bullets $payong.Bullets
Create-Html -RoleTitle "Graphic Designer" -CssPath "../styles.css" -Skills "Graphic Design, Illustration, Print Production, Branding, Storytelling, Marketing" -ExperienceHtml $exp_gd -OutputPath "$baseDir\graphic-design\index.html"

# --- 3. Video Editing ---
$exp_ve = ""
$exp_ve += Get-JobBlock -Title $freelance.Title -Company $freelance.Company -Date $freelance.Date -Bullets @($freelance.Bullets[4], $freelance.Bullets[3], $freelance.Bullets[1], $freelance.Bullets[0], $freelance.Bullets[2])
$exp_ve += Get-JobBlock -Title $bizforce.Title -Company $bizforce.Company -Date $bizforce.Date -Bullets @($bizforce.Bullets[1], $bizforce.Bullets[0], $bizforce.Bullets[2])
$exp_ve += Get-JobBlock -Title $cambridge.Title -Company $cambridge.Company -Date $cambridge.Date -Bullets @($cambridge.Bullets[1], $cambridge.Bullets[2], $cambridge.Bullets[0])
$exp_ve += Get-JobBlock -Title $silong.Title -Company $silong.Company -Date $silong.Date -Bullets $silong.Bullets
$exp_ve += Get-JobBlock -Title $payong.Title -Company $payong.Company -Date $payong.Date -Bullets $payong.Bullets
$exp_ve += Get-JobBlock -Title $eclerx.Title -Company $eclerx.Company -Date $eclerx.Date -Bullets $eclerx.Bullets
Create-Html -RoleTitle "Video Editor" -CssPath "../styles.css" -Skills "Video Editing, Motion Graphics, Post-Production, Animation, Content Creation, Storytelling" -ExperienceHtml $exp_ve -OutputPath "$baseDir\video-editing\index.html"

# --- 4. Content Creation ---
$exp_cc = ""
$exp_cc += Get-JobBlock -Title $freelance.Title -Company $freelance.Company -Date $freelance.Date -Bullets @($freelance.Bullets[1], $freelance.Bullets[2], $freelance.Bullets[3], $freelance.Bullets[0], $freelance.Bullets[4])
$exp_cc += Get-JobBlock -Title $bizforce.Title -Company $bizforce.Company -Date $bizforce.Date -Bullets @($bizforce.Bullets[1], $bizforce.Bullets[0], $bizforce.Bullets[2])
$exp_cc += Get-JobBlock -Title $silong.Title -Company $silong.Company -Date $silong.Date -Bullets @($silong.Bullets[1], $silong.Bullets[0], $silong.Bullets[2])
$exp_cc += Get-JobBlock -Title $payong.Title -Company $payong.Company -Date $payong.Date -Bullets $payong.Bullets
$exp_cc += Get-JobBlock -Title $cambridge.Title -Company $cambridge.Company -Date $cambridge.Date -Bullets $cambridge.Bullets
$exp_cc += Get-JobBlock -Title $eclerx.Title -Company $eclerx.Company -Date $eclerx.Date -Bullets $eclerx.Bullets
Create-Html -RoleTitle "Content Creator" -CssPath "../styles.css" -Skills "Content Creation, Storytelling, Social Media Marketing, Animation, Graphic Design, Video Editing" -ExperienceHtml $exp_cc -OutputPath "$baseDir\content-creation\index.html"

# --- 5. Multimedia Designer ---
$exp_md = ""
$exp_md += Get-JobBlock -Title $bizforce.Title -Company $bizforce.Company -Date $bizforce.Date -Bullets $bizforce.Bullets
$exp_md += Get-JobBlock -Title $freelance.Title -Company $freelance.Company -Date $freelance.Date -Bullets $freelance.Bullets
$exp_md += Get-JobBlock -Title $silong.Title -Company $silong.Company -Date $silong.Date -Bullets $silong.Bullets
$exp_md += Get-JobBlock -Title $cambridge.Title -Company $cambridge.Company -Date $cambridge.Date -Bullets $cambridge.Bullets
$exp_md += Get-JobBlock -Title $payong.Title -Company $payong.Company -Date $payong.Date -Bullets $payong.Bullets
$exp_md += Get-JobBlock -Title $eclerx.Title -Company $eclerx.Company -Date $eclerx.Date -Bullets $eclerx.Bullets
Create-Html -RoleTitle "Multimedia Designer" -CssPath "../styles.css" -Skills "Graphic Design, Motion Graphics, Animation, Video Editing, Marketing, Illustration, Content Creation" -ExperienceHtml $exp_md -OutputPath "$baseDir\multimedia-designer\index.html"

Write-Host "Done!"
