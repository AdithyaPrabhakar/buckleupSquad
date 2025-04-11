// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CertificateStorage {
    struct Certificate {
        string studentName;
        string course;
        string institution;
        string ipfsHash;
        uint256 issuedAt;
    }

    mapping(string => Certificate) public certificates;

    function issueCertificate(
        string memory _certId,
        string memory _studentName,
        string memory _course,
        string memory _institution,
        string memory _ipfsHash
    ) public {
        certificates[_certId] = Certificate({
            studentName: _studentName,
            course: _course,
            institution: _institution,
            ipfsHash: _ipfsHash,
            issuedAt: block.timestamp
        });
    }

    function getCertificate(string memory _certId) public view returns (
        string memory, string memory, string memory, string memory, uint256
    ) {
        Certificate memory cert = certificates[_certId];
        return (
            cert.studentName,
            cert.course,
            cert.institution,
            cert.ipfsHash,
            cert.issuedAt
        );
    }
}
