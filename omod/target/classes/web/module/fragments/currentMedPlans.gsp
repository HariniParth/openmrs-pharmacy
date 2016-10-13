<%
    ui.includeCss("pharmacy", "pharmacy.css")
    ui.includeJavascript("pharmacy", "dataTables.js")
%>

<div id="activeOrdersWindow">
    <table id="currentMedPlansTable">
        <thead>
            <tr>
                <th id="patientSort">Patient Name</th>
                <th id="planSort">Plan Name</th>
                <th id="detailsSort">Details</th>
            </tr>
        </thead>
        <tbody>
            <% patientPlanOrdersMain.each { patientPlanOrderMain -> %>
                <% patientPlanOrderMain.value.each { patientPlanOrder -> %>
                    <tr>
                        <td>${ patientPlanOrderMain.key }</td>
                        <td>${ patientPlanOrder.key }</td>
                        <td>
                            <% patientPlanOrder.value.each { patientPlan -> %>
                                <div id="medRow" onclick="viewPharmaOrderView('${ patientPlan.orderId }','${patientIdentifiers.get(patientPlanOrdersExtn.get(patientPlan.orderId).patientid.toInteger())}','${patientPlanOrderMain.key}','${patientDOB.get(patientPlanOrdersExtn.get(patientPlan.orderId).patientid.toInteger())}','${patientAddress.get(patientPlanOrdersExtn.get(patientPlan.orderId).patientid.toInteger())}','${ patientPlanOrdersExtn.get(patientPlan.orderId).startdate }','${ patientPlanOrdersExtn.get(patientPlan.orderId).drugname.getDisplayString() }','${ patientPlan.route.getDisplayString() }','${ patientPlan.dose }','${ patientPlan.doseUnits.getDisplayString() }','${ patientPlan.duration }','${ patientPlan.durationUnits.getDisplayString() }','${ patientPlan.quantity }','${ patientPlan.quantityUnits.getDisplayString() }','${ patientPlan.frequency }','${ patientPlanOrdersExtn.get(patientPlan.orderId).refill }','${ patientPlanOrdersExtn.get(patientPlan.orderId).lastdispatchdate }','${ patientPlanOrdersExtn.get(patientPlan.orderId).refillinterval }','${providerIdentifiers.get(patientPlan.orderId)}','${ patientPlanOrdersExtn.get(patientPlan.orderId).patientinstructions }','${ patientPlanOrdersExtn.get(patientPlan.orderId).pharmacistinstructions }')">
                                    <span id="order_label">${ patientPlanOrdersExtn.get(patientPlan.orderId).drugname.getDisplayString() }</span>
                                    <span id="order_value">${ patientPlanOrdersExtn.get(patientPlan.orderId).startdate }</span>
                                </div>
                            <% } %>
                        </td>
                    </tr>   
                <% } %>
            <% } %>
        </tbody>
    </table>
</div>

<script>
    jq('#currentMedPlansTable').dataTable({
        "sPaginationType": "full_numbers",
        "bPaginate": true,
        "bAutoWidth": false,
        "bLengthChange": true,
        "bSort": true,
        "bJQueryUI": true,
        "bFilter": false

    });
</script>