<?php
namespace Step\Acceptance;
use Page\XEURLBuilder as XEURL;

class Login extends \AcceptanceTester
{

    public function loginAsUser($id,$pw)
    {
        $I = $this;
        $I->amOnPage(XEURL::getNotEncodedUrl('act','dispMemberLoginForm'));
        $I->fillField('#uid', $id);
        $I->fillField('#upw', $pw);
        $I->click('.control-group .submit');
        $I->dontseeElement('.message.error');
		$I->amOnPage('/');
    }

    public function loginAsAdmin($pw)
    {
        $I = $this;
        $I->amOnPage(XEURL::getNotEncodedUrl('act','dispMemberLoginForm'));
        $I->fillField('#uid', 'admin@admin.net');
        $I->fillField('#upw', $pw);
        $I->click('.control-group .submit');
        $I->dontseeElement('.message.error');
		$I->amOnPage('/');
    }

    public function logout()
    {
        $I = $this;
        $I->amOnPage(XEURL::getNotEncodedUrl('act','dispMemberLogout'));
    }
}
