from playwright.sync_api import sync_playwright

def test_elements1():
    with sync_playwright() as p:
        browser = p.chromium.launch(headless=True)  # Launch Chromium browser
        page = browser.new_page()
        
        page.goto('https://mira.ccs.arubathena.com/home') 
        
        page.locator('input[id="idp-discovery-username"]').fill('GitHub Actions') 
        assert page.locator('input[id="idp-discovery-username"]').input_value() == 'GitHub Actions'
        browser.close()
