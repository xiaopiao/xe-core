<?php
class LoginCest
{
    public function _before(\Step\Acceptance\Login $I)
    {
        $I->loginAsAdmin('admin');
    }

    public function _after(\Step\Acceptance\Login $I)
    {
        $I->logout();
        $I->dontseeElement('.side .hover .login_after');
    }

    // tests
    public function tryToTest(\Step\Acceptance\Login $I)
    {
        $I->wantTo('go to XE Admin');
        $I->seeElement('.side .hover .login_after');
        $I->amOnPage('/index.php?module=admin');
        $I->dontseeElement('#access');
        $I->seeElement('.content .x_page-header');
    }
}
