import os

def generate_html(role_title, css_path, skills, experience_html, output_path):
    html = f"""<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Olan L. Lasquety - {role_title}</title>
    <meta name="description" content="Resume of Olan L. Lasquety, {role_title}.">
    <meta name="robots" content="noindex, nofollow">
    <link rel="stylesheet" href="{css_path}">
</head>
<body>
    <div class="sheet">
        <header>
            <h1>Olan L. Lasquety</h1>
            <p class="role">{role_title}</p>
            <div class="contact">
                <span>📍 Philippines</span>
                <span>✉️ <a href="mailto:lasquetyolanbsn@gmail.com">lasquetyolanbsn@gmail.com</a></span>
                <span>📞 +639186526120</span>
                <span>🔗 <a href="https://lasquetyolan.carrd.co">lasquetyolan.carrd.co</a></span>
            </div>
        </header>
        
        <section class="skills">
            <h2>Skills</h2>
            <p class="skills-list">{skills}</p>
        </section>

        <section class="experience">
            <h2>Work Experience</h2>
            {experience_html}
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
</html>"""
    os.makedirs(os.path.dirname(output_path), exist_ok=True)
    with open(output_path, "w", encoding="utf-8") as f:
        f.write(html)

def job_block(title, company, date, bullets):
    li_items = "".join(f"<li>{b}</li>" for b in bullets)
    return f"""
            <div class="job">
                <div class="job-header">
                    <span class="job-title"><span class="job-title-text">{title}</span>, <span class="job-company">{company}</span></span>
                    <span class="job-date">{date}</span>
                </div>
                <ul class="job-list">
                    {li_items}
                </ul>
            </div>"""

# --- SOURCE DATA BULLETS ---

freelance = {
    "title": "Independent Contractor, Freelance Multimedia Artist",
    "company": "Philippines (Contract, Project Based, Full-Time & Part-Time)",
    "date": "Jul 2023 – present",
    "bullets": [
        "Delivered high-impact visual content—including ads, posters, logos, and product mockups—for both local and international brands, designed to maximize engagement and brand visibility.",
        "Specialized in content creation for social media, producing scroll-stopping graphics and layouts tailored for streamers, startups, and corporate clients.",
        "Managed end-to-end social media content strategy for a startup, including planning, design, and execution, resulting in increased reach and audience interaction.",
        "Produced engaging short-form video content aligned with content calendars and brand messaging, covering pre-production, shooting, and post-production.",
        "Collaborated as a Project-Based Freelance Video Editor for YCP (Mar 2024 – Apr 2025), creating branded video content, short-form edits, and marketing assets for high-profile clients including SM Supermalls, Milo Cambodia, and Close-Up Thailand, contributing to increased impressions and audience engagement."
    ]
}

bizforce = {
    "title": "Multimedia Designer",
    "company": "BizForce - Philippines & USA Remote (Full-Time)",
    "date": "Feb 2026 – Present",
    "bullets": [
        "Led visual rebranding initiatives across digital and print platforms, creating cohesive brand systems, marketing assets, and design guidelines that strengthened brand identity and consistency.",
        "Produced high-performing multimedia content including VSL support visuals, short-form video ads, social media creatives, and internal communication materials tailored for engagement and conversion.",
        "Designed print-ready and physical marketing materials such as event collateral, business card, letterheads and promotional assets while ensuring production accuracy and visual quality across formats."
    ]
}

payong = {
    "title": "Head of Product, AI & Brand Strategy",
    "company": "Payong - Philippines (Part-Time)",
    "date": "Apr 2026 – Present",
    "bullets": [
        "Led product strategy and cross-functional execution for AI-driven digital solutions, aligning product development with business goals, user needs, and market opportunities.",
        "Managed marketing initiatives, brand positioning, and growth campaigns across digital platforms while coordinating stakeholder communication and business development efforts.",
        "Oversaw quality assurance processes, workflow optimization, and product testing to ensure reliable user experiences, operational efficiency, and high delivery standards."
    ]
}

silong = {
    "title": "Creative Director & Vice President",
    "company": "Silong Strategies (Part-Time)",
    "date": "May 2025 – Present | Philippines",
    "bullets": [
        "Built the company’s brand from the ground up, leading identity creation, creative systems, and strategic market positioning to support early-stage business growth.",
        "Led creative and marketing initiatives through the development of high-impact visual assets and campaign materials for digital marketing, investor communications, and business presentations.",
        "Contributed to executive decision-making, growth planning, and overall company strategy in a leadership capacity as acting Vice President."
    ]
}

eclerx = {
    "title": "Analyst Graphic Artist",
    "company": "eClerx - Philippines",
    "date": "Sep 2024 – Nov 2024",
    "bullets": [
        "Crafted visually engaging custom stationery, greeting, and celebration cards for Minted, leveraging Adobe Illustrator to develop and refine vector-based artwork and typography.",
        "Executed end-to-end prepress workflows—applying color management, layout verification, and quality control—to ensure flawless, print-ready designs.",
        "Partnered with customers and internal teams to address inquiries, integrate feedback, and balance aesthetic vision with technical production requirements."
    ]
}

cambridge = {
    "title": "Multimedia Intern",
    "company": "Cambridge University Press & Assessment - cambridge.org",
    "date": "Feb 2023 – Jun 2023",
    "bullets": [
        "Designed marketing and event materials including tarpaulins, layouts, and digital graphics to support internal and external communications.",
        "Edited video content and provided event coverage, contributing to cohesive multimedia storytelling across platforms.",
        "Managed content flow for shared online assets, ensuring timely and organized publishing across digital channels."
    ]
}

all_jobs = [bizforce, payong, silong, eclerx, freelance, cambridge] # Basic chronological/recent focus

base_dir = r"C:\Users\Admin\.gemini\antigravity\scratch\resume"

# 1. Index (General)
# Follows chronological/provided order as closely as possible
exp_index = ""
exp_index += job_block(**bizforce)
exp_index += job_block(**payong)
exp_index += job_block(**silong)
exp_index += job_block(**eclerx)
exp_index += job_block(**freelance)
exp_index += job_block(**cambridge)

generate_html(
    "Multimedia Artist", 
    "styles.css", 
    "Graphic Design, Illustration, Marketing, Animation, Motion Graphics, Content Creation, Storytelling", 
    exp_index, 
    os.path.join(base_dir, "index.html")
)

# 2. Graphic Design (/graphic-design)
# Emphasize eClerx (Graphic Artist), BizForce (Print/Branding), Freelance (Logos/Posters)
exp_gd = ""
# Reorder bullets inside eclerx and bizforce for graphic design emphasis? Actually, prompt says: "For each role, reorder and emphasize the most relevant experience, skills, tools, and projects". We can reorder jobs, and reorder bullets within jobs.

bizforce_gd = dict(bizforce)
bizforce_gd["bullets"] = [bizforce["bullets"][2], bizforce["bullets"][0], bizforce["bullets"][1]] # Print materials first, rebranding second

eclerx_gd = dict(eclerx) # Already highly GD focused

freelance_gd = dict(freelance)
freelance_gd["bullets"] = [freelance["bullets"][0], freelance["bullets"][1], freelance["bullets"][2], freelance["bullets"][3], freelance["bullets"][4]] # Visual content first

silong_gd = dict(silong)
silong_gd["bullets"] = [silong["bullets"][0], silong["bullets"][1], silong["bullets"][2]]

cambridge_gd = dict(cambridge)
cambridge_gd["bullets"] = [cambridge["bullets"][0], cambridge["bullets"][2], cambridge["bullets"][1]]

payong_gd = dict(payong) # Less relevant for pure GD, put at the end

exp_gd += job_block(**eclerx_gd)
exp_gd += job_block(**bizforce_gd)
exp_gd += job_block(**freelance_gd)
exp_gd += job_block(**silong_gd)
exp_gd += job_block(**cambridge_gd)
exp_gd += job_block(**payong_gd)

generate_html(
    "Graphic Designer", 
    "../styles.css", 
    "Graphic Design, Illustration, Print Production, Branding, Storytelling, Marketing", 
    exp_gd, 
    os.path.join(base_dir, "graphic-design", "index.html")
)

# 3. Video Editing (/video-editing)
# Emphasize Freelance (YCP video editor), BizForce (VSL, short form), Cambridge (Video content)
freelance_ve = dict(freelance)
freelance_ve["bullets"] = [freelance["bullets"][4], freelance["bullets"][3], freelance["bullets"][1], freelance["bullets"][0], freelance["bullets"][2]] # Video editing YCP first

bizforce_ve = dict(bizforce)
bizforce_ve["bullets"] = [bizforce["bullets"][1], bizforce["bullets"][0], bizforce["bullets"][2]] # Video ads first

cambridge_ve = dict(cambridge)
cambridge_ve["bullets"] = [cambridge["bullets"][1], cambridge["bullets"][2], cambridge["bullets"][0]] # Edited video content first

exp_ve = ""
exp_ve += job_block(**freelance_ve)
exp_ve += job_block(**bizforce_ve)
exp_ve += job_block(**cambridge_ve)
exp_ve += job_block(**silong)
exp_ve += job_block(**payong)
exp_ve += job_block(**eclerx)

generate_html(
    "Video Editor", 
    "../styles.css", 
    "Video Editing, Motion Graphics, Post-Production, Animation, Content Creation, Storytelling", 
    exp_ve, 
    os.path.join(base_dir, "video-editing", "index.html")
)

# 4. Content Creation (/content-creation)
# Emphasize Freelance (social media, streamers), BizForce (social media creatives), Silong, Payong
freelance_cc = dict(freelance)
freelance_cc["bullets"] = [freelance["bullets"][1], freelance["bullets"][2], freelance["bullets"][3], freelance["bullets"][0], freelance["bullets"][4]]

bizforce_cc = dict(bizforce)
bizforce_cc["bullets"] = [bizforce["bullets"][1], bizforce["bullets"][0], bizforce["bullets"][2]]

silong_cc = dict(silong)
silong_cc["bullets"] = [silong["bullets"][1], silong["bullets"][0], silong["bullets"][2]]

cambridge_cc = dict(cambridge)

exp_cc = ""
exp_cc += job_block(**freelance_cc)
exp_cc += job_block(**bizforce_cc)
exp_cc += job_block(**silong_cc)
exp_cc += job_block(**payong)
exp_cc += job_block(**cambridge_cc)
exp_cc += job_block(**eclerx)

generate_html(
    "Content Creator", 
    "../styles.css", 
    "Content Creation, Storytelling, Social Media Marketing, Animation, Graphic Design, Video Editing", 
    exp_cc, 
    os.path.join(base_dir, "content-creation", "index.html")
)

# 5. Multimedia Designer (/multimedia-designer)
# Emphasize cross-platform, BizForce, Freelance, Cambridge
bizforce_md = dict(bizforce)
freelance_md = dict(freelance)
cambridge_md = dict(cambridge)

exp_md = ""
exp_md += job_block(**bizforce_md)
exp_md += job_block(**freelance_md)
exp_md += job_block(**silong)
exp_md += job_block(**cambridge_md)
exp_md += job_block(**payong)
exp_md += job_block(**eclerx)

generate_html(
    "Multimedia Designer", 
    "../styles.css", 
    "Graphic Design, Motion Graphics, Animation, Video Editing, Marketing, Illustration, Content Creation", 
    exp_md, 
    os.path.join(base_dir, "multimedia-designer", "index.html")
)
