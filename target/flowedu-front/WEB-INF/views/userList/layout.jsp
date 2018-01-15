<%--
  Created by IntelliJ IDEA.
  User: jihoan
  Date: 2017. 4. 27.
  Time: 오후 3:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="container">
    <div id="fui-button" class="pbl"></div>

    <div class="demo-row">
        <div class="demo-title">
            사용자 리스트
        </div>
        <%--<div class="demo-content">--%>
            <table ng-table="tableParams" class="table table-condensed table-bordered table-striped">
                <tr ng-repeat="user in $data">
                    <td data-title="'전화번호'" filter="{phoneNumber:'text'}"><a href="#/userDetail/{{user.userId}}">{{user.phoneNumber}}</a></td>
                    <td data-title="'이름'" filter="{userName:'text'}">{{user.userName | limitTo : 10}}{{user.userName.length > 10 ? '...' : ''}}</td>
                    <td data-title="'성별'" filter="{gender:'text'}">
                        <span ng-show="user.gender =='MALE'">남성</span>
                        <span ng-show="user.gender =='FEMALE'">여성</span>
                    </td>
                    <td data-title="'가입일'" filter="{createDate:'text'}">{{user.createDate}}</td>
                </tr>
            </table>

        <%--</div> <!-- /.demo-ontent -->--%>
    </div> <!-- /.demo-row -->
    <div class="demo-row">
        <div class="demo-title">
            신고 리스트
        </div>
        <table ng-table="tableParams2" class="table table-condensed table-bordered table-striped">
            <tr ng-repeat="userIllegal in $data">
                <td data-title="'신고일시'" filter="{reportDate:'text'}">{{userIllegal.reportDate}}</td>
                <td data-title="'전화번호'" filter="{phoneNumber:'text'}"><a href="#/userDetail/{{userIllegal.userId}}">{{userIllegal.phoneNumber}}</a></td>
                <td data-title="'이름'" filter="{userName:'text'}">{{userIllegal.userName | limitTo: 10}}{{userIllegal.userName.length > 10 ? '...' : ''}}</td>
                <td data-title="'신고사유'" filter="{illegalType:'text'}">
                    <span ng-if="userIllegal.userIllegalType == 'SPAM_MESSAGE'">스팸성 메시지(편지)발송</span>
                    <span ng-if="userIllegal.userIllegalType == 'SEXUAL'">음란/선정적 유해 컨텐츠 게시</span>
                    <span ng-if="userIllegal.userIllegalType == 'INSULT'">욕설/인신공격/타인비방</span>
                    <span ng-if="userIllegal.userIllegalType == 'HACK_RIGHT'">해킹,명의도용 등 불법적 사용</span>
                    <span ng-if="userIllegal.userIllegalType == 'ETC'">기타</span>
                </td>
                <td data-title="'신고자'" filter="{illegalUserName:'text'}">{{userIllegal.illegalUserName | limitTo : 10}}{{userIllegal.illegalUserName.length > 10 ? '...' : ''}}</td>
            </tr>
        </table>
    </div>
</div><!-- /.container -->
