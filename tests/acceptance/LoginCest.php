<?php
class LoginCest
{
    public function _before(\Step\Acceptance\Login $I)
    {
    }

    public function _after(\Step\Acceptance\Login $I)
    {
    }

    // tests
    public function XEAdminTest(\Step\Acceptance\Login $I)
    {
		//access as admin user
		$I->wantTo('check XE Admin');
		$I->loginAsAdmin('admin');
		$I->am('super admin');
        $I->seeElement('.side .hover .login_after');
		$I->amGoingTo('go to XE Admin');
        $I->amOnPage('/index.php?module=admin');
		$I->expect('XE Admin page');
        $I->dontseeElement('#access');
        $I->seeElement('.content .x_page-header');
		
		//access as guest
		$I->logout();
		$I->am('guest');
		$I->amGoingTo('go to XE Admin');
		$I->amOnPage('/index.php?module=admin');
		$I->expect('not admin error page');
        $I->seeElement('#access');
        $I->dontseeElement('.content .x_page-header');
    }
}
