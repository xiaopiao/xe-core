<?php
use \AcceptanceTester;

class AdminSitemapCest
{
	public function _before(AcceptanceTester $I, Step\Acceptance\Login $login)
	{
		$I->amOnPage('/');
		if ($I->loadSessionSnapshot('admin')) return;
		$login->loginAsAdmin('admin');
		$I->saveSessionSnapshot('admin');
		
		$I->amOnPage("/index.php?module=admin");
		$I->executeJS("doRecompileCacheFile();");
		$I->acceptPopup();
	}

	public function _after(AcceptanceTester $I)
	{
	}
	
	/**
	* @group admin-sitemap
	* @group admin-sitemap-001
	*/
	public function admin_sitemap_001_001(AcceptanceTester $I)
	{
		$I->wantTo("admin_sitemap_001_001");
		$I->amOnPage("/index.php?module=admin&act=dispMenuAdminSiteMap");
		$I->wait(2);
		
		$I->click(".x_btn.x_btn-link._addSiteMap1");
		
		$I->fillField("#sitemapName", "SITEMAP");
		$I->click("#add_sitemap .x_btn.x_btn-primary.x_pull-right._save");
	}
	
	/**
	* @group admin-sitemap
	* @group admin-sitemap-001
	*/
	public function admin_sitemap_001_002(AcceptanceTester $I)
	{
		$I->wantTo("admin_sitemap_001_002");
		$I->amOnPage("/index.php?module=admin&act=dispMenuAdminSiteMap");
		$I->click("SITEMAP");
		$I->click("사이트맵 편집");
		$I->fillField("#sitemapName2", "SITEMAP_");
		$I->click("#sitemap_general .x_btn.x_btn-primary.x_pull-right._save");
	}
	
	/**
	* @group admin-sitemap
	* @group admin-sitemap-001
	*/
	public function admin_sitemap_001_003(AcceptanceTester $I)
	{
		$I->wantTo("admin_sitemap_001_003");
		$I->amOnPage("/index.php?module=admin&act=dispMenuAdminSiteMap");
		$I->click("SITEMAP_");
		$I->click("메뉴 추가");
		$I->click("게시판");
		$I->fillField("#lang_menuName2", "SQ");
		$I->fillField("#lang_menuDesc2", "SQ2");
		$I->click("//div[@id='add_menu']/fieldset/div/div/button");
	}
	
	/**
	* @group admin-sitemap
	* @group admin-sitemap-001
	*/
	public function admin_sitemap_001_004(AcceptanceTester $I)
	{
		$I->wantTo("admin_sitemap_001_004");
		$I->setCookie("__xe_admin_jstree_open_srls", "menu359");
		$I->amOnPage("/index.php?module=admin&act=dispMenuAdminSiteMap");
		$I->click("SITEMAP_");
		$I->click("메뉴 추가");
		$I->click("바로가기");
		
		$I->fillField("#lang_menuName2", "URL");
		$I->fillField("input._linkUrl", "http://example.com/");
		$I->click("//div[@id='add_menu']/fieldset/div/div/button");
		$I->click("URL");
		$I->wait(2);
		$href = $I->grabAttributeFrom("#properties section h1 a","href");
		$I->assertEquals("http://example.com/",$href);
	}
	
	/**
	* @group admin-sitemap
	* @group admin-sitemap-001
	*/
	public function admin_sitemap_001_005(AcceptanceTester $I)
	{
		$I->wantTo("admin_sitemap_001_005");
		$I->setCookie("__xe_admin_jstree_open_srls", "menu359");
		$I->amOnPage("/index.php?module=admin&act=dispMenuAdminSiteMap");
		$defUrl = $I->executeJS('return default_url');
		$I->click("SITEMAP_");
		$I->click("메뉴 추가");
		$I->click("바로가기");
		
		$I->fillField("#lang_menuName2", "MENULINK");
		$I->click("메뉴 링크");
		$I->click("Board2");
		$I->click("//div[@id='add_menu']/fieldset/div/div/button");
		$I->click("MENULINK");
		$I->wait(2);
		$href = $I->grabAttributeFrom("#properties section h1 a","href");
		$I->assertEquals($defUrl . "board2",$href);
	}
	
	/**
	* @group admin-sitemap
	* @group admin-sitemap-001-012
	*/
	public function admin_sitemap_001_012(AcceptanceTester $I)
	{
		$I->wantTo("admin_sitemap_001_012");
		$I->setCookie("__xe_admin_jstree_open_srls", "menu62");
		$I->amOnPage("/index.php?module=admin&act=dispMenuAdminSiteMap");
		$I->wait(2);
		
		$I->click("Board2");
		$I->wait(2);
		$I->click("li.homepage label");
		$I->wait(1);
		$I->amOnPage("/");
		$I->see("Site Logo");
		
		$I->amOnPage("/index.php?module=admin&act=dispMenuAdminSiteMap");
		$I->wait(2);
		
		$I->click("Welcome Page");
		$I->wait(2);
		$I->click("li.homepage label");
		$I->wait(1);
		$I->amOnPage("/");
		$I->see("MAIN PAGE");
	}
}
