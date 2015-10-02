<?php
use \AcceptanceTester;

class MemberAdminCest
{
    public function _before(AcceptanceTester $I, Step\Acceptance\Login $login)
    {
		$I->amOnPage('/');
		if ($I->loadSessionSnapshot('admin')) return;
		$login->loginAsAdmin('admin');
		$I->saveSessionSnapshot('admin');
    }

    public function _after(\Step\Acceptance\Login $I)
    {
    }

    public function admin_member_001_001(AcceptanceTester $I)
    {
		$I->wantTo('[admin_member_001_001] 모든회원, 최고관리자, 승인, 거부 카테고리 별 목록이 잘 나오는가?');
		$I->amOnPage('/index.php?module=admin&act=dispMemberAdminList');
		$I->seeElement('.x_btn-group .x_btn-inverse');
		$I->amOnPage('/index.php?module=admin&act=dispMemberAdminList&filter_type=super_admin');
		$I->seeElement('.x_btn-group .x_btn-inverse');
		$I->amOnPage('/index.php?module=admin&act=dispMemberAdminList&filter_type=enable');
		$I->seeElement('.x_btn-group .x_btn-inverse');
		$I->amOnPage('/index.php?module=admin&act=dispMemberAdminList&filter_type=disable');
		$I->seeElement('.x_btn-group .x_btn-inverse');
    }
	
    public function admin_member_001_002(AcceptanceTester $I)
    {
		$I->wantTo('[admin_member_001_002] 페이지 이동이 잘 되는가?');
		$I->amOnPage('/index.php?module=admin&act=dispMemberAdminList');
		$I->seeElement('.x_btn-group .x_btn-inverse');
		$I->amOnPage('/index.php?module=admin&act=dispMemberAdminList&page=2');
		$I->seeElement('.x_btn-group .x_btn-inverse');
    }
}
