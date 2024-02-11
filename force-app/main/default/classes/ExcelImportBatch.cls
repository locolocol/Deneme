public class ExcelImportBatch {

    private static final String REPO_OWNER = 'locolocol';
    private static final String REPO_NAME = 'TestingImport';
    private static final String FILE_NAME = 'Testing Import File.xlsx'; // Replace with the actual file name
    private static final String BRANCH = 'main';
    private static final String GITHUB_TOKEN = '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';

    public static void importData() {
        HttpRequest request = new HttpRequest();
        String endpoint = createGitHubApiUrl(REPO_OWNER, REPO_NAME, FILE_NAME, BRANCH);
        System.debug('GitHub API Request URL: ' + endpoint);

        request.setEndpoint(endpoint);
        request.setMethod('GET');
        request.setHeader('Authorization', 'Bearer ' + GITHUB_TOKEN);
        System.debug('GitHub API Request Method: ' + request.getMethod());
        System.debug('GitHub API Request Headers: ' + request.getHeader('Authorization'));

        HttpResponse response = new Http().send(request);

        System.debug('GitHub API Response Status Code: ' + response.getStatusCode());
        System.debug('GitHub API Response Body: ' + response.getBody());

        if (response.getStatusCode() == 200) {
            Map<String, Object> githubData = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());

            GitHub_File__c gitHubRecord = new GitHub_File__c(
                Name__c = String.valueOf(githubData.get('Name')),
                Last_Name__c = String.valueOf(githubData.get('Last Name')),
                City__c = String.valueOf(githubData.get('City')),
                State__c = String.valueOf(githubData.get('State'))
            );

            insert gitHubRecord;
        }
    }

    private static String createGitHubApiUrl(String repoOwner, String repoName, String fileName, String branch) {
        return 'https://api.github.com/repos/' + repoOwner + '/' + repoName + '/contents/' + fileName + '?ref=' + branch;
    }
}


/*public class ExcelImportBatch implements Database.Batchable<SObject>, Database.AllowsCallouts {

    private String repoOwner = 'locolocol';
    private String repoName = 'TestingImport';
    private String fileName = 'Testing Import File.xlsx'; // Replace with the actual file name
    private String branch = 'main';
    private String githubToken = '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'; // Replace with your actual GitHub access token

    public Database.QueryLocator start(Database.BatchableContext bc) {
        String query = 'SELECT Id, Name__c, Last_Name__c, State__c, City__c FROM GitHub_File__c';
        return Database.getQueryLocator(query);
    }

    public void execute(Database.BatchableContext context, List<SObject> scope) {
        for (SObject record : scope) {
            GitHub_File__c customObject = (GitHub_File__c)record;

            String apiUrl = createGitHubApiUrl(repoOwner, repoName, fileName, branch);

            HttpRequest request = new HttpRequest();
            request.setEndpoint(apiUrl);
            request.setMethod('GET');
            request.setHeader('Authorization', 'Bearer ' + githubToken);

            HttpResponse response = new Http().send(request);

            handleResponse(response, customObject);
        }
    }

    private String createGitHubApiUrl(String repoOwner, String repoName, String fileName, String branch) {
        return 'https://api.github.com/repos/' + repoOwner + '/' + repoName + '/contents/' + fileName + '?ref=' + branch;
    }

    private void handleResponse(HttpResponse response, GitHub_File__c customObject) {
        try {
            System.debug('Entering handleResponse method');

            if (response.getStatusCode() == 200) {
                System.debug('GitHub API Response Status Code: ' + response.getStatusCode());

                Map<String, Object> githubData = (Map<String, Object>)JSON.deserializeUntyped(response.getBody());
                System.debug('GitHub API Response Body: ' + response.getBody());

                String nameFromGitHub = String.valueOf(githubData.get('Name__c'));
                String lastNameFromGitHub = String.valueOf(githubData.get('Last_Name__c'));
                String stateFromGitHub = String.valueOf(githubData.get('State__c'));
                String cityFromGitHub = String.valueOf(githubData.get('City__c'));

                System.debug('Name from GitHub: ' + nameFromGitHub);
                System.debug('Last Name from GitHub: ' + lastNameFromGitHub);
                System.debug('State from GitHub: ' + stateFromGitHub);
                System.debug('City from GitHub: ' + cityFromGitHub);

                customObject.Name__c = nameFromGitHub;
                customObject.Last_Name__c = lastNameFromGitHub;
                customObject.State__c = stateFromGitHub;
                customObject.City__c = cityFromGitHub;
            } else {
                System.debug('Error: ' + response.getStatusCode() + ' - ' + response.getStatus());
            }
        } catch (Exception e) {
            System.debug('Error parsing GitHub API response: ' + e.getMessage());
        }
    }

    public void finish(Database.BatchableContext context) {
        System.debug('Batch Job Finished Successfully');
    }
}




  */