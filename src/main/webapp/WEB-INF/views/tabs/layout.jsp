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
            Dynamic Tabs
        </div>
        <div class="demo-content">
            <tabset>
                <tab heading="Static title">Static content</tab>
                <tab ng-repeat="tab in tabs" heading="{{tab.title}}" active="tab.active" disabled="tab.disabled">
                    {{tab.content}}
                </tab>
                <tab select="alertMe()">
                    <tab-heading>
                        <i class="glyphicon glyphicon-bell"></i> Alert!
                    </tab-heading>
                    I've got an HTML heading, and a select callback. Pretty cool!
                </tab>
            </tabset>
        </div> <!-- /.demo-content -->
    </div> <!-- /.demo-row -->
</div><!-- /.container -->