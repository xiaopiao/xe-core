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

	/**
	 * @group admin-comment
	 * @group admin-comment-001
	 */
    public function admin_comment_001_001(AcceptanceTester $I)
    {
		$I->wantTo("admin_comment_001_001");
		$I->amOnPage(XEURL::getNotEncodedUrl('module','admin','act','dispCommentAdminList'));
		$I->see(' 삭제될 댓글');
	}

	/**
	 * @group admin-comment
	 * @group admin-comment-001
	 */
	public function admin_comment_001_002(AcceptanceTester $I)
	{
		$I->wantTo("admin_comment_001_002");
		$I->amOnPage(XEURL::getNotEncodedUrl('module','admin','act','dispCommentAdminList'));
		$I->see('비밀 댓글');
		$I->see('감사합니다');
		$I->click("//table[@id='commentListTable']/caption/a[2]");
		$I->dontsee('비밀 댓글');
		$I->see('감사합니다');
		$I->click("//table[@id='commentListTable']/caption/a[3]");
		$I->see('비밀 댓글');
		$I->dontsee('감사합니다');
		$I->click("//table[@id='commentListTable']/caption/a[4]");
		$I->see('발행 전 댓글');
		$I->dontsee('감사합니다');
		$I->click("//table[@id='commentListTable']/caption/a[5]");
		$I->dontsee('발행 전 댓글');
		$I->see('감사합니다');
		$I->click("//table[@id='commentListTable']/caption/a[6]");
		$I->see('신고당한 댓글');
		$I->dontsee('감사합니다');
	}

	/**
	 * @group admin-comment
	 * @group admin-comment-001
	 */
	public function admin_comment_001_003(AcceptanceTester $I)
	{
		$I->wantTo("admin_comment_001_003");
		$I->amOnPage(XEURL::getNotEncodedUrl('module','admin','act','dispCommentAdminList'));
		$I->seeElement('.x_btn-group .x_btn.modalAnchor.xe-modal-window.x_disabled');
		$I->amOnPage(XEURL::getNotEncodedUrl('module','admin','act','dispCommentAdminList','page',2));
		$I->seeElement('.x_btn-group .x_btn.modalAnchor.xe-modal-window.x_disabled');
	}

	/**
	 * @group admin-comment
	 * @group admin-comment-001
	 */
	public function admin_comment_001_004(AcceptanceTester $I)
	{
		$I->wantTo("admin_comment_001_004");
		$I->amOnPage(XEURL::getNotEncodedUrl('module','admin','act','dispCommentAdminList'));
		$I->selectOption("select[name=\"search_target\"]", "내");
		$I->fillField("search_keyword", "Board1");
		$I->click("button.x_btn.x_btn-inverse");
		$I->see('Board1');
		$I->dontsee('감사합니다');
	}

	/**
	 * @group admin-comment
	 * @group admin-comment-001
	 */
	public function admin_comment_001_005(AcceptanceTester $I)
	{
		$I->wantTo("admin_comment_001_005");
		$I->amOnPage(XEURL::getNotEncodedUrl('module','admin','act','dispCommentAdminList'));
		$I->selectOption("select[name=\"search_target\"]", "아이디");
		$I->fillField("search_keyword", "user_id");
		$I->click("button.x_btn.x_btn-inverse");
		$I->see('일반 사용자의 댓글');
		$I->dontsee('감사합니다');
	}

	/**
	 * @group admin-comment
	 * @group admin-comment-001
	 */
	public function admin_comment_001_006(AcceptanceTester $I)
	{
		$I->wantTo("admin_comment_001_006");
		$I->amOnPage(XEURL::getNotEncodedUrl('module','admin','act','dispCommentAdminList'));
		$I->selectOption("select[name=\"search_target\"]", "이름");
		$I->fillField("search_keyword", "user_name");
		$I->click("button.x_btn.x_btn-inverse");
		$I->see('일반 사용자의 댓글');
		$I->dontsee('감사합니다');
	}

	/**
	 * @group admin-comment
	 * @group admin-comment-001
	 */
	public function admin_comment_001_007(AcceptanceTester $I)
	{
		$I->wantTo("admin_comment_001_007");
		$I->amOnPage(XEURL::getNotEncodedUrl('module','admin','act','dispCommentAdminList'));
		$I->selectOption("select[name=\"search_target\"]", "닉네임");
		$I->fillField("search_keyword", "nick_name");
		$I->click("button.x_btn.x_btn-inverse");
		$I->see('일반 사용자의 댓글');
		$I->dontsee('감사합니다');
	}

	/**
	 * @group admin-comment
	 * @group admin-comment-001
	 */
	public function admin_comment_001_008(AcceptanceTester $I)
	{
		$I->wantTo("admin_comment_001_008");
		$I->amOnPage(XEURL::getNotEncodedUrl('module','admin','act','dispCommentAdminList'));
		$I->selectOption("select[name=\"search_target\"]", "회원 번호");
		$I->fillField("search_keyword", "268");
		$I->click("button.x_btn.x_btn-inverse");
		$I->see('일반 사용자의 댓글');
		$I->dontsee('감사합니다');
	}

	/**
	 * @group admin-comment
	 * @group admin-comment-001
	 */
	public function admin_comment_001_009(AcceptanceTester $I)
	{
		$I->wantTo("admin_comment_001_009");
		$I->amOnPage(XEURL::getNotEncodedUrl('module','admin','act','dispCommentAdminList'));
		$I->selectOption("select[name=\"search_target\"]", "이메일 주소");
		$I->fillField("search_keyword", "email@domain.com");
		$I->click("button.x_btn.x_btn-inverse");
		$I->see('일반 사용자의 댓글');
		$I->dontsee('감사합니다');
	}

	/**
	 * @group admin-comment
	 * @group admin-comment-001
	 */
	public function admin_comment_001_010(AcceptanceTester $I)
	{
		$I->wantTo("admin_comment_001_010");
		$I->amOnPage(XEURL::getNotEncodedUrl('module','admin','act','dispCommentAdminList'));
		$I->selectOption("select[name=\"search_target\"]", "홈페이지");
		$I->fillField("search_keyword", "http://example.com");
		$I->click("button.x_btn.x_btn-inverse");
		$I->see('홈페이지가 있는 댓글');
		$I->dontsee('감사합니다');
	}

	/**
	 * @group admin-comment
	 * @group admin-comment-001
	 */
	public function admin_comment_001_011(AcceptanceTester $I)
	{
		$I->wantTo("admin_comment_001_011");
		$I->amOnPage(XEURL::getNotEncodedUrl('module','admin','act','dispCommentAdminList'));
		$I->selectOption("select[name=\"search_target\"]", "등록일");
		$I->fillField("search_keyword", "19800101");
		$I->click("button.x_btn.x_btn-inverse");
		$I->see('오래된 댓글');
		$I->dontsee('감사합니다');
	}

	/**
	 * @group admin-comment
	 * @group admin-comment-001
	 */
	public function admin_comment_001_012(AcceptanceTester $I)
	{
		$I->wantTo("admin_comment_001_012");
		$I->amOnPage(XEURL::getNotEncodedUrl('module','admin','act','dispCommentAdminList'));
		$I->selectOption("select[name=\"search_target\"]", "최근수정일 ");
		$I->fillField("search_keyword", "20100101");
		$I->click("button.x_btn.x_btn-inverse");
		$I->see('방금 수정된 댓글');
		$I->dontsee('감사합니다');
	}

	/**
	 * @group admin-comment
	 * @group admin-comment-001
	 */
	public function admin_comment_001_013(AcceptanceTester $I)
	{
		$I->wantTo("admin_comment_001_013");
		$I->amOnPage(XEURL::getNotEncodedUrl('module','admin','act','dispCommentAdminList'));
		$I->selectOption("select[name=\"search_target\"]", "IP 주소");
		$I->fillField("search_keyword", "192.168.0.1");
		$I->click("button.x_btn.x_btn-inverse");
		$I->see('일반 사용자의 댓글');
		$I->dontsee('신고당한 댓글');
	}

	/**
	 * @group admin-comment
	 * @group admin-comment-001
	 */
	public function admin_comment_001_014(AcceptanceTester $I)
	{
		$I->wantTo("admin_comment_001_014");
		$I->amOnPage(XEURL::getNotEncodedUrl('module','admin','act','dispCommentAdminList'));
		$I->selectOption("select[name=\"search_target\"]", "IP 주소");
		$I->fillField("search_keyword", "192.168.0.1");
		$I->click("button.x_btn.x_btn-inverse");
		$I->see('일반 사용자의 댓글');
		$I->dontsee('신고당한 댓글');
		$I->click('취소');
		$I->dontSeeInField('search_keyword', '192.168.0.1');
	}

	/**
	 * @group admin-document
	 * @group admin-document-002
	 */
	public function admin_comment_002_001(AcceptanceTester $I)
	{
		$I->wantTo("admin_comment_002_001");
		$I->amOnPage(XEURL::getNotEncodedUrl('module','admin','act','dispDocumentAdminList'));

		$I->click("(//a[contains(text(),'휴지통')])[2]");
		$I->see('선택한 문서가 없습니다.');
		$I->click('.x_btn.x_btn-inverse.x_pull-right.x_btn-primary._ok');

		$I->click("//a[contains(text(),'삭제')]");
		$I->see('선택한 문서가 없습니다.');
		$I->click('.x_btn.x_btn-inverse.x_pull-right.x_btn-primary._ok');

		$I->click("//a[contains(text(),'이동')]");
		$I->see('선택한 문서가 없습니다.');
		$I->click('.x_btn.x_btn-inverse.x_pull-right.x_btn-primary._ok');

		$I->click("//a[contains(text(),'복사')]");
		$I->see('선택한 문서가 없습니다.');
		$I->click('.x_btn.x_btn-inverse.x_pull-right.x_btn-primary._ok');
	}

	/**
	 * @group admin-document
	 * @group admin-document-002
	 */
	public function admin_comment_002_002(AcceptanceTester $I)
	{
		$I->wantTo("admin_comment_002_002");
		$I->amOnPage(XEURL::getNotEncodedUrl('module','admin','act','dispDocumentAdminList'));

		$I->click("(//input[@name='cart'])[3]");
		$I->click("(//a[contains(text(),'휴지통')])[2]");
		$I->click("//form[@id='manageForm']/div[3]/button");

		$I->dontSee('휴지통으로 보내질 글입니다.');
	}

	/**
	 * @group admin-document
	 * @group admin-document-002
	 */
	public function admin_comment_002_003(AcceptanceTester $I)
	{
		$I->wantTo("admin_comment_002_003");
		$I->amOnPage(XEURL::getNotEncodedUrl('module','admin','act','dispDocumentAdminList'));

		$I->click("(//input[@name='cart'])[3]");
		$I->click("//a[contains(text(),'삭제')]");
		$I->click("//form[@id='manageForm']/div[3]/button");

		$I->dontSee('삭제될 글입니다.');
	}

	/**
	 * @group admin-document
	 * @group admin-document-002
	 */
	public function admin_comment_002_004(AcceptanceTester $I)
	{
		$I->wantTo("admin_comment_002_004");
		$I->amOnPage(XEURL::getNotEncodedUrl('module','admin','act','dispDocumentAdminList'));

		$I->click("(//input[@name='cart'])[2]");
		$I->click("//a[contains(text(),'이동')]");
		$I->executeJS('jQuery("input[name=\'module_srl\']").attr("value",263);');
		$I->click("//form[@id='manageForm']/div[3]/button");

		$I->amOnPage(XEURL::getNotEncodedUrl('mid','board1'));
		$I->dontSee('게시판2로 가고 싶은 글');

		$I->amOnPage(XEURL::getNotEncodedUrl('mid','board2'));
		$I->see('게시판2로 가고 싶은 글');
		$I->click('게시판2로 가고 싶은 글');

		$I->see('보내드립니다.');
		$I->see('감사합니다');
	}

	/**
	 * @group admin-document
	 * @group admin-document-002
	 */
	public function admin_comment_002_005(AcceptanceTester $I)
	{
		$I->wantTo("admin_comment_002_005");
		$I->amOnPage(XEURL::getNotEncodedUrl('module','admin','act','dispDocumentAdminList'));

		$I->click("input[name=cart]");
		$I->click("//a[contains(text(),'복사')]");
		$I->executeJS('jQuery("input[name=\'module_srl\']").attr("value",263);');
		$I->click("//form[@id='manageForm']/div[3]/button");

		$I->amOnPage(XEURL::getNotEncodedUrl('mid','board1'));
		$I->see('쌍둥이 게시글');
		$I->click('쌍둥이 게시글');

		$I->see('안보이는데요?');
		$I->see('기분 탓입니다.');

		$I->amOnPage(XEURL::getNotEncodedUrl('mid','board2'));
		$I->see('쌍둥이 게시글');
		$I->click('쌍둥이 게시글');

		$I->see('안보이는데요?');
		$I->see('기분 탓입니다.');
	}
}
