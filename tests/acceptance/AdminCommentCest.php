<?php
use \AcceptanceTester;
use Page\XEURLBuilder as XEURL;

class AdminCommentCest
{
    public function _before(AcceptanceTester $I, Step\Acceptance\Login $login)
    {
		$I->amOnPage('/');
		if ($I->loadSessionSnapshot('admin')) return;
		$login->loginAsAdmin('admin');
		$I->saveSessionSnapshot('admin');
    }

    public function _after(AcceptanceTester $I)
    {
    }

    // tests
    public function tryToTest(AcceptanceTester $I)
    {
    }
}
